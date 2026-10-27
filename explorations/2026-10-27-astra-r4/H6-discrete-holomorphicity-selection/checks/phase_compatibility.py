#!/usr/bin/env python3
"""Exact B5 cycle/phase check; P3 on P2, category-free, no continuum rung.
Run: python3 PATH/phase_compatibility.py > PATH/phase_compatibility.txt
Source: ../NOTE.md, B5; all values below are explicitly declared test data.
"""
from collections import deque
import sympy as s

# Four faces around a vertex, with four shared edges, form an incidence cycle.
faces = ['p0','p1','p2','p3']
edges = ['e0','e1','e2','e3']
truth = {v:s.sympify(x) for v,x in zip(faces+edges, [1,s.I,-1,-s.I,s.I,1,-s.I,-1])}
incidences = []
for j in range(4):
    incidences.extend([(faces[j],edges[j]), (faces[(j+1)%4],edges[j])])
phases = {(p,e): s.cancel(truth[e]/truth[p]) for p,e in incidences}


def reconstruct(data):
    adjacency = {v: [] for v in faces+edges}
    for (p,e),u in data.items():
        adjacency[p].append((e,u))
        adjacency[e].append((p,1/u))
    values = {'p0':s.Integer(1)}
    queue = deque(['p0'])
    while queue:
        v = queue.popleft()
        for dest,u in adjacency[v]:
            proposed = s.cancel(u*values[v])
            if dest in values:
                assert values[dest] == proposed, f'nontrivial phase cycle at {v}->{dest}'
            else:
                values[dest] = proposed
                queue.append(dest)
    return values


def holonomy(data):
    return s.cancel(s.prod(data[(faces[j],edges[j])]/
                           data[(faces[(j+1)%4],edges[j])] for j in range(4)))

assert holonomy(phases) == 1
solution = reconstruct(phases)
assert solution == truth
assert all(solution[e] == solution[p]*u for (p,e),u in phases.items())
print('GREEN: all edge/face phases reconstructed; all eight incidence relations hold')
print('Exact incidence-cycle holonomy:', holonomy(phases))
corrupt = dict(phases)
corrupt[('p0','e0')] *= -1
assert holonomy(corrupt) == -1
try:
    reconstruct(corrupt)
except AssertionError as exc:
    print('RED mutation caught:', exc)
else:
    raise AssertionError('A nontrivial phase-cycle obstruction was silently accepted')
assert reconstruct(phases) == truth
print('GREEN restored; PASS: tree construction and nontrivial-holonomy rejection')
