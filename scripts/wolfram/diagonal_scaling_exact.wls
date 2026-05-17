(* Exact checks for the conditional diagonal scaling theorem. *)

ClearAll[check, b, chiral, nonchiral, R, e];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr, b > 1]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

chiral = {0, 2/5, 2/5 + 1};
nonchiral = {0, 4/5, 4/5 + 1};

Do[
  name = pair[[1]];
  weights = pair[[2]];
  R = DiagonalMatrix[b^(-weights)];
  Do[
    e = UnitVector[Length[weights], i];
    check[name <> " basis " <> ToString[i], R.e == b^(-weights[[i]]) e],
    {i, Length[weights]}
  ],
  {pair, {{"chiral b^(-h_i)", chiral}, {"nonchiral b^(-Delta_i)", nonchiral}}}
];

Print["all exact diagonal scaling checks passed"];
