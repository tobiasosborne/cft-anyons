"""Reproduce: PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3
explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/fermion_check.py
Outputs JSON beside this script. --mutate-wrap must fail the independent
Fermi-surface invariant. No network, Julia, source changes, or large Fock matrix.
Layer: chiral, category-free sourced CAR regularization; finite ->R2 diagnostic.
"""
import argparse
import hashlib
import json
from pathlib import Path
import platform
import tomllib
import numpy as np
from fermion_core import (ATOL, action_matrix, bounds, car_oracle, cocycle,
    excitation_energy, inputs, mode, momenta, norm, quadratic, residual, sea)
from fermion_collar import full_collar

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[3]
PAIRS=((1,-1),(2,-2),(3,-3),(2,1),(2,-1),(-2,-1),(-2,1))


def full_diagonal_Q(M,m,n,A,B,C,z,mutate_collar=False):
    """Exact full finite-Fock norm via additive spectral dynamic programming.

    C=[A,B]-(m-n)A_(m+n) is diagonal; R=:dGamma(C):+c_S(A,B)-z.
    Each excitation contributes v_i=C_ii for r_i>0, -C_ii for r_i<0.
    Q increments are integer half-units. At each exact Q, propagate extrema
    of sum v_i over every occupation. Weighted diagonal norm is their max.
    This proves an equality for the finite Fock norm; it is not sampling.
    """
    assert norm(C-np.diag(np.diag(C)))<ATOL
    rs=momenta(M)
    lo=hi=np.array([0.])
    for r,c in zip(rs,np.diag(C)):
        w,v=int(round(2*abs(r))),float(c if r>0 else -c)
        newlo,newhi=np.full(len(lo)+w,np.inf),np.full(len(hi)+w,-np.inf)
        newlo[:len(lo)]=lo
        newhi[:len(hi)]=hi
        newlo[w:]=np.minimum(newlo[w:],lo+v)
        newhi[w:]=np.maximum(newhi[w:],hi+v)
        lo,hi=newlo,newhi
    k=1+np.arange(len(lo))/2
    delta=cocycle(A,B)-z
    amplitude=np.maximum(abs(lo+delta),abs(hi+delta))
    finite=np.isfinite(amplitude)
    k,amplitude=k[finite],amplitude[finite]
    weighted=amplitude/k**2
    j=int(np.argmax(weighted))
    result=dict(norm=float(weighted[j]),maximizing_Q=float(k[j]-1),
                energy_bins=len(k),fock_dimension=2**M,scalar_error=float(delta))
    # Checked analytic envelope, valid for fixed m in {1,2,3}, all M>=8.
    # Interior: C(r)=2m sin(eps*r)/eps *
    # [cos(eps*r)cos^4(eps*m/4)sinc(eps*m)-1]. Hence
    # |C(r)|<=m eps²|r|³+(7m³/12)eps²|r|.
    # A missing edge transition adds <=(m-1)²/4; its |r|>=pi/eps-m+1/2.
    # For eps<=pi/4 the minimum eps*r² is pi*(4.5-m)²/4.
    # Therefore |C(r)|<=C_m eps*r². Excitation additivity gives
    # |:dGamma(C):|<=C_m eps Q², since sum r_i²<=Q².
    # Scalar error <=B_m eps² from |a²-q²|<=2|q| D_M(m,r).
    eps=2*np.pi/M
    C_m=np.pi*(m+7*m**3/24)+(m-1)**2/(np.pi*(4.5-m)**2)
    qs=np.arange(.5,m,1.)-m/2
    B_m=float(sum(qs**4/3+m*m*qs**2/8))
    assert max(abs(np.diag(C))-C_m*eps*rs**2)<ATOL
    assert abs(delta)<=B_m*eps**2+ATOL
    analytic=C_m*eps+B_m*eps**2
    assert result['norm']<=analytic+ATOL
    result['analytic_full_Fock_bound']=dict(C_m=float(C_m),B_m=B_m,
        value=float(analytic),formula='C_m*(2*pi/M)+B_m*(2*pi/M)^2',
        scope='all M>=8, m=1,2,3, n=-m; K=1+Q; all graph orders s (diagonal)')
    result['collar_bounds']=full_collar(m,B_m,analytic,k,amplitude,C,rs,mutate_collar)
    result['collar_b_by_s']=result['collar_bounds']['exact_b_by_s']
    if M==8:
        brute=[]
        for bits in range(2**M):
            direct=residual(A,B,mode(M,m+n),m,n,bits,z)
            assert set(direct).issubset({bits})
            E=excitation_energy(M,bits,'Q')
            brute.append(abs(direct.get(bits,0.))/(1+E)**2)
        assert abs(max(brute)-result['norm'])<ATOL
        result['brute_force_all_256_occupations_agrees']=True
    return result


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--mutate-wrap',action='store_true')
    parser.add_argument('--mutate-collar',action='store_true')
    args=parser.parse_args()
    baseline=tomllib.loads((ROOT/'cft_machine/benchmarks/fermion/runs/2026-09-22/results.toml').read_text())
    tests=[]
    for row in baseline['modes']:
        M,n=row['sites'],row['mode']
        A,B=mode(M,n,wrap=args.mutate_wrap),mode(M,-n,wrap=args.mutate_wrap)
        independent=sum((np.cos(np.pi*n/(2*M))**2*np.sin(2*np.pi*(r-n/2)/M)/(2*np.pi/M))**2
                        for r in np.arange(.5,n,1.))
        assert abs(cocycle(A,B)-independent)<ATOL, 'mutation rejected: Fermi-surface cocycle'
        assert abs(cocycle(A,B)-row['schwinger'])<ATOL, 'existing Julia run mismatch'
        assert norm(A.T-B)<ATOL, 'adjointness'
    tests.append('nine existing Julia cocycles and independent Fermi-surface sums agree')
    oracle=car_oracle()
    tests.append('independent Kronecker CAR oracle, all M=4 columns, Eq.(28)')
    rows=[]
    for M in (8,16,32):
        initial=inputs(M,4)
        for m,n in PAIRS:
            A,B,C=mode(M,m),mode(M,n),mode(M,m+n)
            z=(m**3-m)/12 if m+n==0 else 0.
            defect=A@B-B@A-(m-n)*C
            BA,BB,BC=mode(M,m,True),mode(M,n,True),mode(M,m+n,True)
            actions=[residual(A,B,C,m,n,b,z) for b in initial]
            R,output=action_matrix(actions,initial)
            # Independent quadratic-lift oracle for each computed residual column.
            delta=cocycle(A,B)-z
            for b,col in zip(initial,actions):
                check=quadratic(defect,b)
                check[b]=check.get(b,0.)+delta
                keys=set(col)|set(check)
                assert max((abs(col.get(k,0.)-check.get(k,0.)) for k in keys),default=0)<ATOL
            exact=[residual(BA,BB,BC,m,n,b,z) for b in initial]
            RB,outB=action_matrix(exact,initial)
            if M>=16:
                assert norm(RB)<ATOL, 'continuum core Witt+central invariant'
            row=dict(M=M,m=m,n=n,central=z,finite_schwinger=cocycle(A,B),
                Q_input_cutoff=4,continuum_compressed_residual_norm=norm(RB),
                cutoff_norms={},one_particle_norms={})
            row['outputs_above_input_cutoff']=int(sum(excitation_energy(M,b,'Q')>4 for b in output))
            for control in ('Q','E_D'):
                row['cutoff_norms'][control]={str(s):bounds(M,R,initial,output,control,s) for s in (0,1,2)}
                rs=momenta(M)
                energy=abs(rs) if control=='Q' else 2*np.sin(np.pi*abs(rs)/M)/(2*np.pi/M)
                K=1+energy
                row['one_particle_norms'][control]={str(s):norm(K[:,None]**s*defect/K[None,:]**(s+2)) for s in (0,1,2)}
            if m+n==0:
                row['full_finite_Fock_Q']=full_diagonal_Q(M,m,n,A,B,defect,z,args.mutate_collar)
                # Exact one-excitation endpoint witness for actual modified
                # chiral energy E_chiral=:dGamma(A_0):, NOT conformal Q.
                bits=sea(M) ^ (1 << (M-1))
                direct=residual(A,B,C,m,n,bits,z).get(bits,0.)
                eps=2*np.pi/M
                e=np.sin(eps/2)/eps
                a=np.cos(eps*m/4)**2*np.sin(eps*(m+1)/2)/eps
                formula=-a*a-2*m*e+delta
                assert abs(direct-formula)<ATOL
                assert abs(excitation_energy(M,bits,'E_chiral')-e)<ATOL
                row['E_chiral_endpoint_witness']=dict(
                    energy=float(e),residual_diagonal=float(direct),
                    full_Fock_two_loss_norm_lower_bound=float(abs(direct)/(1+e)**2),
                    limiting_lower_bound=(m*m+6*m+1)/9,
                    limiting_residual=-(m*m+6*m+1)/4,
                    status='analytic limit via sin(x)/x ->1; delta ->0 by finite Fermi sum')
                pair=bits ^ 1  # UV particle plus opposite-edge hole: neutral and even.
                pair_value=residual(A,B,C,m,n,pair,z).get(pair,0.)
                assert abs(pair_value-(-2*a*a-4*m*e+delta))<ATOL
                row['E_chiral_endpoint_witness']['neutral_even_pair']=dict(
                    energy=float(2*e),residual_diagonal=float(pair_value),
                    full_Fock_two_loss_norm_lower_bound=float(abs(pair_value)/(1+2*e)**2),
                    limiting_lower_bound=(m*m+6*m+1)/8)
            rows.append(row)
    tests.extend(['all direct Fock columns match normal-ordered one-particle commutator plus Schwinger scalar',
                  'all M>=16 continuum cutoff residuals vanish with full output',
                  'diagonal full-Fock dynamic programming agrees with all M=8 occupations',
                  'uniform one-loss and O(M^-1/2) full-Fock diagonal collar envelopes dominate exact DP'])
    sources=['cft_machine/benchmarks/fermion/FermionBenchmark.jl',
             'cft_machine/benchmarks/fermion/runs/2026-09-22/results.toml',
             'references/text/CFTFromLatticeFermions.txt']
    headline='Modified chiral energy fails two-loss A4 (neutral even UV witness ->1); conformal Q diagonal residuals admit O(1/M) full-Fock and O(M^-1/2) collar bounds.'
    result=dict(status='bounded CAR calibration; no D2 geometric Ward instance',headline=headline,python=platform.python_version(),
        numpy=np.__version__,input_cutoff='all Q<=4 occupations; every generated output retained',
        controls=dict(Q='sum |r| particle/hole excitation energies; exact padding transport',
                      E_D='Dirac-dispersion weights on same chiral sea proxy; not actual microscopic Dirac GNS',
                      E_chiral='actual normal-ordered modified chiral A_0; endpoint witness only'),
        graph_norm='||K_out^s R K_in^(-s-2) P_(Q<=4)||',
        collar='||K_out^s R exp(-t K_in) P_(Q<=4)|| <= b t^(-s-1.5), 0<t<=1',
        tolerance=ATOL,tests_passed=tests,independent_CAR_oracle=oracle,
        provenance_sha256={p:hashlib.sha256((ROOT/p).read_bytes()).hexdigest() for p in sources},rows=rows)
    out=HERE/'fermion_results.json'
    out.write_text(json.dumps(result,indent=2)+'\n')
    print(headline)
    print('PASS: '+ '; '.join(tests))
    print('M pair | cutoff Q s=0 | cutoff E_D s=0 | full Fock Q | E_chiral full-Fock lower witness')
    for row in rows:
        q=row['cutoff_norms']['Q']['0']['norm']
        e=row['cutoff_norms']['E_D']['0']['norm']
        full=row.get('full_finite_Fock_Q',{}).get('norm')
        witness=row.get('E_chiral_endpoint_witness',{}).get('full_Fock_two_loss_norm_lower_bound')
        print(row['M'],(row['m'],row['n']),f'{q:.10g}',f'{e:.10g}',
              '-' if full is None else f'{full:.10g}', '-' if witness is None else f'{witness:.10g}')
    print('Wrote',out.relative_to(ROOT))


if __name__=='__main__':
    main()
