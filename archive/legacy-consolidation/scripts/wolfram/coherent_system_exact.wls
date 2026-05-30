(* Exact finite checks for coherent refinement maps and ascending observables. *)

ClearAll[check, matPow, Emap, ascend, lift, A, Obs];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

matPow[A_, k_Integer] := MatrixPower[A, k];
Emap[n_Integer, m_Integer] := matPow[A, m - n];
ascend[n_Integer, m_Integer, O_] := Transpose[Emap[n, m]].O.Emap[n, m];
lift[n_Integer, m_Integer, O_] := Emap[n, m].O.Transpose[Emap[n, m]];

A = {{3/5, -4/5}, {4/5, 3/5}};
Obs = {{2, 1/3}, {1/3, 5/2}};

check["adjacent isometry", Transpose[A].A == IdentityMatrix[2]];

Do[
  {n, m, l} = triple;
  check["identity map n=" <> ToString[n], Emap[n, n] == IdentityMatrix[2]];
  check["coherence n=" <> ToString[n] <> " m=" <> ToString[m] <>
    " l=" <> ToString[l], Emap[m, l].Emap[n, m] == Emap[n, l]];
  check["map isometry n=" <> ToString[n] <> " m=" <> ToString[l],
    Transpose[Emap[n, l]].Emap[n, l] == IdentityMatrix[2]];
  check["ascending unital n=" <> ToString[n] <> " m=" <> ToString[l],
    ascend[n, l, IdentityMatrix[2]] == IdentityMatrix[2]];
  check["ascending composition n=" <> ToString[n] <> " m=" <>
    ToString[m] <> " l=" <> ToString[l],
    ascend[n, m, ascend[m, l, Obs]] == ascend[n, l, Obs]];
  check["logical lift identity n=" <> ToString[n],
    lift[n, n, Obs] == Obs];
  check["logical lift composition n=" <> ToString[n] <> " m=" <>
    ToString[m] <> " l=" <> ToString[l],
    lift[m, l, lift[n, m, Obs]] == lift[n, l, Obs]],
  {triple, {{0, 0, 0}, {0, 1, 3}, {1, 3, 5}, {2, 4, 7}}}
];

Print["all exact coherent system checks passed"];
