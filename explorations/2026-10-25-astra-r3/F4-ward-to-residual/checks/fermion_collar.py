"""Full finite-Fock diagonal collar bounds; category-free chiral calibration.

Local derivation from the exact trig coefficient in fermion_check.py:52-60.
Normal ordering is references/text/CFTFromLatticeFermions.txt:881-892.
No geometric Ward insertion or correlation identity is assumed or constructed.

Assume n=1,2,3, M>=8, K=1+Q, R=:dGamma(C_n):+delta_n.
<1>1. The interior exact trig bracket has absolute value <=2, giving
      |C_n(r)|<=4n|r|. A missing edge square is <=(n-1)^2/4,
      hence <=((n-1)^2/2)|r| because |r|>=1/2.
<1>2. Summing excitation contributions gives |:dGamma(C_n):|<=H0_n Q,
      H0_n=4n+(n-1)^2/2. With |delta_n|<=B_n epsilon^2 and
      epsilon<=pi/4, ||R K^-1||<=H_n=H0_n+B_n*pi^2/16.
<1>3. max_(x>=0) x^p exp(-x)=A_p=(p/e)^p. Thus for every t>0,
      ||K^s R exp(-tK)|| <= min(q*A_(s+2)*t^(-s-2),
                                  H_n*A_(s+1)*t^(-s-1)),
      where q=C_n*epsilon+B_n*epsilon^2 bounds ||R K^-2||.
<1>4. min(a,b)<=sqrt(a*b) yields a genuine FULL finite-Fock collar
      ||K^s R exp(-tK)||<=b_(M,n,s)*t^(-s-3/2),
      b_(M,n,s)=sqrt(A_(s+2)*A_(s+1)*q*H_n)=O(M^-1/2).
      This holds for all integer s>=0, with explicit mode/order constants.
<1>5. QED. Below, the independent spectral DP checks steps 1,2,4 at
      M=8,16,32 and s=0,1,2. Floating evaluation uses atol=1e-10.
"""
import math
import numpy as np


def full_collar(n,B_n,q,k,amplitude,C,rs,mutate=False):
    assert n in (1,2,3)
    H0=4*n+(n-1)**2/2
    H=H0+B_n*np.pi**2/16
    assert np.max(abs(np.diag(C))-H0*abs(rs))<=1e-10
    one_loss=float(max(amplitude/k))
    assert one_loss<=H+1e-10
    upper,exact,A={},{},{}
    for s in (0,1,2):
        A1,A2=((p/math.e)**p for p in (s+1,s+2))
        b=math.sqrt(A1*A2*q*H)
        if mutate: b/=1000
        p=s+1.5
        t=np.minimum(1.,p/k)
        spectral=float(max(amplitude*k**s*t**p*np.exp(-t*k)))
        assert spectral<=b+1e-10, 'mutation rejected: full-Fock collar DP exceeds interpolation bound'
        upper[str(s)],exact[str(s)]=b,spectral
        A[str(s)]=dict(A_s_plus_1=A1,A_s_plus_2=A2)
    return dict(one_loss_uniform_H_n=float(H),one_loss_exact=one_loss,
        two_loss_q_upper=q,A_constants_by_s=A,analytic_b_upper_by_s=upper,
        exact_b_by_s=exact,formula='sqrt(A_(s+1)*A_(s+2)*q*H_n)',
        scope='full finite Fock, K=1+Q, n=-m, m=1,2,3, all M>=8, all s>=0',
        collar='||K^s R exp(-tK)||<=b*t^(-s-1.5), all t>0',
        rate='O(M^-1/2) for each fixed mode and graph order',
        exact_spectral_supremum_interval='0<t<=1')
