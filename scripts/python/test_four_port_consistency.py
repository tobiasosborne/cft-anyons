"""Exact four-port sewing probes; CONVENTIONS (ai), LC-9--LC-12.

No truncated-series extrapolation to crossing, and no complete CFT claim.
"""
import unittest
import sympy as s
from four_port_sewing import sew_quotient, dual_crossing, inverse_metric_derivative, block_coefficients, ward_pairing
from four_port_semion import (
    Z, blocks, connection, channel_metric, tensor_data, reflected_kernel,
    bpz_residual, global_null_residuals, global_ward_residuals, braid_checks, multiplicity_kernels,
)
from small_category_stress import Virasoro
from small_category_sewing import R,canon,Category


class FourPortConsistency(unittest.TestCase):
    def test_positive_quotient_and_null_rejection(self):
        gram=s.ones(2)
        self.assertEqual(sew_quotient(gram,s.Matrix([[1,1]]),s.ones(2,1)),1)
        with self.assertRaises(AssertionError):
            sew_quotient(gram,s.Matrix([[1,1]]),s.Matrix([1,0]))
        with self.assertRaises(AssertionError):
            sew_quotient(gram,s.Matrix([[1,0]]),s.ones(2,1))

    def test_nonorthogonal_resolution_of_identity(self):
        e=s.Matrix([[1,s.I],[0,2]])
        gram=e.conjugate().T*e
        self.assertEqual(s.simplify(e*gram.inv()*e.conjugate().T),s.eye(2))

    def test_complex_categorical_dual_conversion(self):
        f=s.Matrix([[1,s.I],[s.I,1]])/s.sqrt(2)
        u=dual_crossing(f)
        self.assertEqual(s.simplify(f.T*u),s.eye(2))
        self.assertEqual(u,s.conjugate(f))
        kr=s.Matrix([2,3]);kl=f*kr;br=s.Matrix([5,7])
        self.assertEqual(s.simplify((kl.T*u*br-kr.T*br)[0]),0)

    def test_metric_linearization_sign(self):
        t=s.symbols("t")
        gram=s.Matrix([[2,1],[1,3]]);change=s.Matrix([[1,2],[2,0]])
        direct=(gram+t*change).inv().diff(t).subs(t,0)
        self.assertEqual(inverse_metric_derivative(gram,change),direct)

    def test_semion_quotient_gram_coefficients(self):
        self.assertEqual(block_coefficients(1,s.Rational(1,4),0),
                         [1,0,s.Rational(1,8),s.Rational(1,8),s.Rational(15,128)])
        self.assertEqual(block_coefficients(1,s.Rational(1,4),1),
                         [1,s.Rational(1,2),s.Rational(3,8),s.Rational(5,16),s.Rational(35,128)])
        rep=Virasoro(1,1);basis=rep.basis(3)
        gram=rep.gram(3);rho=s.Matrix([ward_pairing(w,1,s.Rational(1,4)) for w in basis])
        self.assertEqual(len(gram.nullspace()),1)
        self.assertTrue(all((n.T*rho)[0]==0 for n in gram.nullspace()))

    def test_fibonacci_exact_conditional_coefficients(self):
        c,h=s.Rational(14,5),s.Rational(2,5)
        self.assertEqual(block_coefficients(c,h,0),[1,0,s.Rational(4,35),s.Rational(4,35),s.Rational(19,175)])
        self.assertEqual(block_coefficients(c,h,h),
                         [1,s.Rational(1,5),s.Rational(11,50),s.Rational(26,125),s.Rational(34067,173750)])

    def test_semion_exact_ode_and_normalizations(self):
        v=blocks()
        self.assertTrue(all(bpz_residual(f)==0 for f in v))
        self.assertEqual(s.limit(s.sqrt(Z)*v[0],Z,0,dir="+"),1)
        self.assertEqual(s.limit(v[1]/s.sqrt(Z),Z,0,dir="+"),1)
        self.assertEqual(s.limit(s.diff(s.sqrt(Z)*v[0],Z),Z,0,dir="+"),0)

    def test_exact_crossing_and_positive_channel_metric(self):
        v=blocks();m=connection();d=channel_metric()
        self.assertEqual(m*m,s.eye(2))
        self.assertTrue(all(s.simplify(x)==0 for x in v.subs(Z,1-Z)-m*v))
        self.assertEqual(m.T*d*m,d)
        q=s.diag(1,s.sqrt(3)/2)
        normalized=s.simplify(q*m*q.inv())
        self.assertEqual(normalized,s.Matrix([[s.Rational(1,2),s.sqrt(3)/2],
                                              [s.sqrt(3)/2,-s.Rational(1,2)]]))

    def test_semion_tensor_associator_and_norms(self):
        e1,e2,e3,a0,a1=tensor_data()
        self.assertEqual(e1-e2+e3,s.zeros(16,1))
        v=blocks();bs=a0*v[0]+a1*v[1]
        bt=(e3-(1-Z)*e2)/(2*s.sqrt(Z*(1-Z)))
        self.assertTrue(all(s.simplify(x)==0 for x in bs+bt))
        self.assertEqual((a0.T*a0)[0],1)
        self.assertEqual((a0.T*a1)[0],0)
        self.assertEqual((a1.T*a1)[0],s.Rational(3,4))
        self.assertTrue(any(s.simplify(x)!=0 for x in (a0*blocks()[0])+bt))

    def test_pair_reflection_is_positive_with_declared_orientation(self):
        _,_,_,a0,a1=tensor_data()
        swap=s.Matrix([[1,0,0,0],[0,0,1,0],[0,1,0,0],[0,0,0,1]])
        pa=(s.eye(4)-swap)/2;ps=(s.eye(4)+swap)/2
        self.assertEqual(reflected_kernel(a0),pa)
        self.assertEqual(reflected_kernel(a1),ps/2)
        self.assertEqual(pa*ps,s.zeros(4))
        self.assertEqual((pa.rank(),ps.rank()),(1,3))

    def test_all_four_ports_obey_global_null_equations(self):
        self.assertEqual(global_null_residuals(),[0]*8)

    def test_global_mobius_ward_equations(self):
        self.assertEqual(global_ward_residuals(),[0]*6)

    def test_adjacent_braid_polynomial_and_branch_checks(self):
        self.assertTrue(all(braid_checks()))

    def test_fibonacci_midpoint_eigenspaces(self):
        cat=Category("Fib")
        f=s.Matrix([[cat.F(1,1,1,1,e,g) for g in (0,1)] for e in (0,1)])
        even=s.Matrix([1,R**-3]);odd=s.Matrix([1,-R**3])
        self.assertTrue(all(canon(x)==0 for x in f*even-even))
        self.assertTrue(all(canon(x)==0 for x in f*odd+odd))

    def test_graded_positivity_selects_semion_doublet_in_declared_ansatz(self):
        for dim in (2,4):
            p,k0,k1,epsilon=multiplicity_kernels(dim)
            self.assertEqual(p*p,p)
            self.assertEqual(k0,p)
            self.assertEqual(k1,s.eye(dim*dim)/dim-p/2)
            self.assertEqual((epsilon.T*k1*epsilon)[0]/dim,s.Rational(1,dim)-s.Rational(1,2))
        p,k0,k1,_=multiplicity_kernels(4)
        # At z=1/2 the WHOLE reflected kernel is positive despite negative
        # energy-one coefficient: this cannot replace graded Hilbert positivity.
        self.assertEqual(s.Rational(3,2)*k0+k1,s.eye(16)/4+p)


if __name__=="__main__":
    unittest.main(verbosity=2)
