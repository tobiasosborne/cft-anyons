(* Exact finite-matrix component orthogonality checks. *)

ClearAll[check, EMat, gram, componentGram];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

EMat = {{1/Sqrt[2], 0}, {I/Sqrt[2], 0}, {0, 1}};
gram = ConjugateTranspose[EMat].EMat;
componentGram = Table[
  Sum[Conjugate[EMat[[b, a]]] EMat[[b, ap]], {b, Length[EMat]}],
  {a, Length[EMat[[1]]]}, {ap, Length[EMat[[1]]]}
];

check["component Gram equals E^*E", componentGram == gram];
check["component orthogonality", componentGram == IdentityMatrix[2]];

Print["all exact component orthogonality checks passed"];
