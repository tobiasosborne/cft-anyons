(* Exact rational checks for the Fibonacci conformal-weight input. *)

ClearAll[check, su2WZWSpinWeight, tauH, tauDelta, vacuumH, vacuumOPE, tauOPE];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 48], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

su2WZWSpinWeight[level_, spin_] := spin (spin + 1)/(level + 2);

tauH = su2WZWSpinWeight[3, 1];
tauDelta = tauH + tauH;
vacuumH = 0;
vacuumOPE = vacuumH - 2 tauH;
tauOPE = tauH - 2 tauH;

check["SU(2)_3 spin-1 h", tauH == 2/5];
check["diagonal left+right Delta", tauDelta == 4/5];
check["tau primary exponent", -tauH == -2/5];
check["diagonal tau exponent", -tauDelta == -4/5];
check["vacuum channel OPE exponent", vacuumOPE == -4/5];
check["tau channel OPE exponent", tauOPE == -2/5];
check["vacuum norm exponent", 2 vacuumOPE == -8/5];
check["tau norm exponent", 2 tauOPE == -4/5];

Do[
  check["tau descendant exponent n=" <> ToString[n],
    -(tauH + n) == -(2/5 + n)];
  check["vacuum descendant exponent n=" <> ToString[n],
    -(vacuumH + n) == -n],
  {n, 0, 6}
];

Print["all exact CFT weight checks passed"];
