"""Exact probes of LC-6--LC-8, with source conventions (ah).

Run: python3 scripts/python/test_small_category_inputs.py
No chain diagonalization; all radicals and Gram entries are exact.
"""
import itertools
import unittest
import sympy as s
from small_category_sewing import R, canon, Category, multiplication, assoc_residuals, frobenius_blocks, cohomology_data
from small_category_stress import Virasoro, partitions, exchange, null_selection


class SmallCategoryInputs(unittest.TestCase):
    def test_field_and_sourced_associators(self):
        self.assertEqual(canon(R**4-R**2-1), 0)
        fib, sem = Category("Fib"), Category("Semion")
        f = s.Matrix([[fib.F(1,1,1,1,e,t) for t in (0,1)] for e in (0,1)])
        self.assertTrue(all(canon(v)==0 for v in f*f-s.eye(2)))
        self.assertEqual(sem.F(1,1,1,1,0,0), -1)

    def test_positive_associative_products(self):
        for name in ("VecZ2", "Fib"):
            with self.subTest(category=name):
                cat = Category(name)
                self.assertTrue(all(canon(v)==0 for v in assoc_residuals(cat)))

    def test_dagger_frobenius_and_specialness(self):
        for name, expected in (("VecZ2",s.Integer(2)),("Fib",R**4)):
            with self.subTest(category=name):
                cat=Category(name)
                for total in (0,1):
                    left,right,mmstar,row = frobenius_blocks(cat,total)
                    self.assertTrue(all(canon(v)==0 for v in left-mmstar))
                    self.assertTrue(all(canon(v)==0 for v in right-mmstar))
                    self.assertEqual(canon((row*row.T)[0]-expected),0)

    def test_semion_obstruction_is_associator_dependent(self):
        cat=Category("Semion")
        alpha=s.symbols("alpha",real=True)
        residues=assoc_residuals(cat,alpha=alpha)
        self.assertIn(2*alpha,[s.expand(v) for v in residues])
        self.assertTrue(all(s.simplify(v.subs(alpha,0))==0 for v in residues))
        left,right,mmstar,_=frobenius_blocks(cat,1,alpha=0)
        self.assertTrue(any(v!=0 for v in left-mmstar))
        self.assertTrue(any(v!=0 for v in right-mmstar))

    def test_fibonacci_categorical_complex_and_contraction(self):
        d1,d2,h2,separability = cohomology_data()
        self.assertTrue(all(canon(v)==0 for v in d2*d1))
        self.assertEqual(canon((h2*d1)[0]),1)
        self.assertTrue(all(canon(v)==0 for v in separability))
        self.assertNotEqual(canon(d1[0]),0)
        self.assertNotEqual(canon(d2[1,0]),0)
        for pair in itertools.combinations(range(3),2):
            self.assertEqual(canon(d2.extract(pair,(0,1)).det()),0)

    def test_virasoro_gram_matches_independent_level_two_formula(self):
        c,h=s.symbols("c h")
        v=Virasoro(c,h)
        self.assertEqual(v.gram(1),s.Matrix([[2*h]]))
        expected=s.Matrix([[4*h+c/2,6*h],[6*h,8*h*h+4*h]])
        self.assertEqual(v.gram(2),expected)

    def test_selected_stress_lifts_through_grade_four(self):
        for c,h,ranks in ((s.Integer(1),s.Rational(1,4),(1,1,2,3)),
                          (s.Rational(14,5),s.Rational(2,5),(1,2,3,5))):
            v=Virasoro(c,h)
            for grade,rank in enumerate(ranks,1):
                with self.subTest(c=c,h=h,grade=grade):
                    gram=v.gram(grade)
                    self.assertEqual(gram.rank(),rank)
                    for size in range(1,gram.rows+1):
                        for ix in itertools.combinations(range(gram.rows),size):
                            self.assertGreaterEqual(gram.extract(ix,ix).det(),0)

    def test_semion_null_descends_and_gives_local_selection_equation(self):
        v=Virasoro(1,s.Rational(1,4))
        self.assertEqual(v.gram(2)*s.Matrix([1,-1]),s.zeros(2,1))
        out=s.symbols("out")
        equation=null_selection(s.Rational(1,4),s.Rational(1,4),out)
        self.assertEqual(s.expand(equation-out*(1-out)),0)
        self.assertEqual(null_selection(s.Rational(1,4),0,s.Rational(1,4)),0)

    def test_vacuum_exchange_coefficients_and_all_low_grade_ward_relations(self):
        cases=((1,s.Rational(1,4),(s.Rational(1,2),s.Rational(1,4),s.Rational(1,8),s.Rational(1,24))),
               (s.Rational(14,5),s.Rational(2,5),(s.Rational(2,7),s.Rational(1,7),s.Rational(1,14),s.Rational(1,42))))
        for c,h,expected in cases:
            with self.subTest(c=c,h=h):
                vectors=exchange(c,h,4)
                self.assertEqual((vectors[2][(2,)],vectors[3][(3,)],
                                  vectors[4][(4,)],vectors[4][(2,2)]),expected)
                vac=Virasoro(c,0,vacuum=True)
                for grade in range(1,5):
                    for n in range(1,grade+1):
                        lhs=vac.apply(n,vectors[grade])
                        rhs={word:s.expand((grade-n+(n-1)*h)*coef)
                             for word,coef in vectors[grade-n].items()}
                        rhs={w:a for w,a in rhs.items() if a!=0}
                        self.assertEqual(lhs,rhs)

    def test_shifted_c_lift_is_not_excluded_by_gram_positivity(self):
        for c,h in ((9,s.Rational(1,4)),(s.Rational(54,5),s.Rational(2,5))):
            gram=Virasoro(c,h).gram(2)
            self.assertGreater(gram[0,0],0)
            self.assertGreater(gram.det(),0)


if __name__=="__main__":
    unittest.main(verbosity=2)
