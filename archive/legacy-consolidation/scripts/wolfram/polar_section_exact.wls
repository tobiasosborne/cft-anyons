(* Exact finite-matrix polar-section checks. *)

ClearAll[check, BMat, GMat, RMat, EMat, entryFormula];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

BMat = {{2, 0, 0}, {0, 3, 0}};
GMat = BMat.ConjugateTranspose[BMat];
RMat = {{1/2, 0}, {0, 1/3}};
EMat = ConjugateTranspose[BMat].RMat;
entryFormula = Table[
  Sum[Conjugate[BMat[[mu, nu]]] RMat[[mu, m]], {mu, Length[BMat]}],
  {nu, Length[BMat[[1]]]}, {m, Length[BMat]}
];

check["inverse-square-root condition", ConjugateTranspose[RMat].(GMat.RMat) == IdentityMatrix[2]];
check["diagonal Gram entries", Diagonal[GMat] == {4, 9}];
check["diagonal inverse sqrt entries", RMat == DiagonalMatrix[1/Sqrt /@ Diagonal[GMat]]];
check["polar section isometry", ConjugateTranspose[EMat].EMat == IdentityMatrix[2]];
check["polar entry formula", EMat == entryFormula];

Print["all exact polar section checks passed"];
