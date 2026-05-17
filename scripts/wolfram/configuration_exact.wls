(* Exact checks for finite ordered site configurations. *)

ClearAll[check, configs, particleNumber];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

particleNumber[cfg_List] := Count[cfg, Except[0]];

Do[
  configs = Tuples[{0, 1}, n];
  check["Fibonacci configurations n=" <> ToString[n], Length[configs] == 2^n];
  check["vacuum particle number n=" <> ToString[n], particleNumber[ConstantArray[0, n]] == 0];
  check["tau particle number n=" <> ToString[n], particleNumber[ConstantArray[1, n]] == n];
  Do[
    check[
      "particle sector n=" <> ToString[n] <> " k=" <> ToString[k],
      Count[configs, cfg_ /; particleNumber[cfg] == k] == Binomial[n, k]
    ],
    {k, 0, n}
  ],
  {n, 0, 8}
];

Print["all exact configuration checks passed"];
