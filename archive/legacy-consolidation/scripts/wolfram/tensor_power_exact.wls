(* Exact finite checks for fixed-map Kronecker tensor powers. *)

ClearAll[check, tensorPower, reversalPermutation, matE, matErect, T, U];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

tensorPower[m_, n_Integer] := Nest[KroneckerProduct[m, #] &, {{1}}, n];
reversalPermutation[n_Integer] := Table[If[i + j == n + 1, 1, 0], {i, n}, {j, n}];

matE = {{3/5, -4/5}, {4/5, 3/5}};

check["base isometry", Transpose[matE].matE == IdentityMatrix[2]];

Do[
  T = tensorPower[matE, n];
  check["tensor power n=" <> ToString[n],
    Transpose[T].T == IdentityMatrix[Length[Transpose[T]]]],
  {n, 0, 6}
];

matErect = {{1, 0}, {0, 3/5}, {0, 4/5}};
check["rectangular base isometry", Transpose[matErect].matErect == IdentityMatrix[2]];

Do[
  T = tensorPower[matErect, n];
  U = reversalPermutation[Length[T]];
  check["dressing unitary n=" <> ToString[n],
    Transpose[U].U == IdentityMatrix[Length[T]]];
  check["dressed tensor power n=" <> ToString[n],
    Transpose[U.T].(U.T) == IdentityMatrix[Length[Transpose[T]]]],
  {n, 0, 4}
];

Print["all exact tensor power checks passed"];
