(* Exact charge-only contrast counterexample. *)

ClearAll[check, amplitude, b, target, R, identity, contrast];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

amplitude = 1/2;
b = 32;
target = b^(-2/5);
R = {{(1 + amplitude)/2, (1 - amplitude)/2},
     {(1 - amplitude)/2, (1 + amplitude)/2}};
identity = {1, 1};
contrast = {1, -1};

check["charge-only identity fixed", R.identity == identity];
check["charge-only contrast eigenvalue", R.contrast == amplitude contrast];
check["b=32 target b^(-2/5)", target == 1/4];
check["chosen amplitude differs from b^(-2/5)", amplitude != target];

Print["all exact charge-only negative checks passed"];
