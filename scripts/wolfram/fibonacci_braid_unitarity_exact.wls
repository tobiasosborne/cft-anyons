(* Exact symbolic checks for the sourced 5 x 5 Fibonacci braid construction B = F R F^*. *)

ClearAll[check];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

phi = (1 + Sqrt[5])/2;
a = 1/phi;
b = 1/Sqrt[phi];

Fmat = {
  {1, 0, 0, 0, 0},
  {0, 1, 0, 0, 0},
  {0, 0, 1, 0, 0},
  {0, 0, 0, a, b},
  {0, 0, 0, b, -a}
};

Rmat = DiagonalMatrix[{Exp[4 Pi I/5], Exp[-3 Pi I/5], Exp[-3 Pi I/5],
  Exp[4 Pi I/5], Exp[-3 Pi I/5]}];

Bmat = Fmat.Rmat.ConjugateTranspose[Fmat];

check["F left unitarity", ConjugateTranspose[Fmat].Fmat == IdentityMatrix[5]];
check["F right unitarity", Fmat.ConjugateTranspose[Fmat] == IdentityMatrix[5]];
check["F adjoint equals inverse", ConjugateTranspose[Fmat] == Inverse[Fmat]];
check["R left unitarity", ConjugateTranspose[Rmat].Rmat == IdentityMatrix[5]];
check["R right unitarity", Rmat.ConjugateTranspose[Rmat] == IdentityMatrix[5]];
check["B matches F R F inverse", Bmat == Fmat.Rmat.Inverse[Fmat]];
check["B left unitarity", ConjugateTranspose[Bmat].Bmat == IdentityMatrix[5]];
check["B right unitarity", Bmat.ConjugateTranspose[Bmat] == IdentityMatrix[5]];

Print["all exact Fibonacci braid unitarity checks passed"];
