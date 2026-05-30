(* Exact finite-matrix postcomposition isometry checks. *)

ClearAll[check, EMat, EBad, FMat, GMat, I2];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

EMat = {{1/Sqrt[2], 0}, {I/Sqrt[2], 0}, {0, 1}};
EBad = {{1, 0}, {0, 2}, {0, 0}};
FMat = {{1 + I, 2 - I}, {-1/2 + I/4, 3}};
GMat = {{2 - I, -1 + I/2}, {1 + 2 I, 3/4 - I}};
I2 = IdentityMatrix[2];

check["fine-graining matrix isometry", ConjugateTranspose[EMat].EMat == IdentityMatrix[2]];
check[
  "postcomposition preserves Gram",
  ConjugateTranspose[EMat.FMat].(EMat.GMat) == ConjugateTranspose[FMat].GMat
];
check[
  "postcomposition preserves norm",
  ConjugateTranspose[EMat.FMat].(EMat.FMat) == ConjugateTranspose[FMat].FMat
];
check[
  "converse identity test recovers isometry",
  ConjugateTranspose[EMat.I2].(EMat.I2) == I2
];
check[
  "non-isometry fails identity Gram test",
  ConjugateTranspose[EBad.I2].(EBad.I2) != I2
];

Print["all exact postcomposition isometry checks passed"];
