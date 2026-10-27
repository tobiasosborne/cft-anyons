# H3 graph checks

Pillar P4: test the reusable all-carrier quadratic estimate in a declared
source-modified complex CAR calibration. The general theorem and its proof
are in `graph_certificate.md`; finite sampled values do not prove its rates.
No network access or commits were used. All files are confined to H3.

From `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/`:

```bash
python3 checks/graph_check.py > checks/graph_green.json
python3 checks/graph_check.py --mutation wrap > checks/mutation_wrap.txt 2>&1
python3 checks/graph_check.py --mutation normal-order > checks/mutation_normal-order.txt 2>&1
python3 checks/graph_check.py --mutation energy > checks/mutation_energy.txt 2>&1
```

Acceptance, 2026-10-27: GREEN command exited 0 (under one second).
Each mutation exited **1** at its intended invariant:

- `wrap`: a forbidden UV edge appears.
- `normal-order`: the zero mode no longer annihilates the sea vacuum.
- `energy`: the exact linear-energy mode shift fails for the sine control.

The sparse CAR check includes every excitation occupation at M=4 and M=8
(16 and 256 states), every bracket m,n in [-2,2], adjoint pairing,
normal-order Schwinger identity, and complete coarse-carrier refinement
columns for M=4→8 and M=8→16. It constructs no many-body dense
diagonalization. Float64 absolute assertion tolerance is `2e-10`.

Headline: A3 fails at p=1 by a UV lower bound tending to
`2(sqrt(2)-1)/pi=0.2636965437895248`; the fixed vacuum-pair direction has
`||T_-2 Omega||→1/sqrt(2)`. Analytic proof establishes p>1, with smallest
integer p=2: A3 O(epsilon), all-bracket A4 O(epsilon²).
The fixed diagonal witness `(Omega+w)/sqrt(2)` has
`<v,T_-2 K^-1 v> >= 1/(2sqrt(2)pi)` at every M>=4.
