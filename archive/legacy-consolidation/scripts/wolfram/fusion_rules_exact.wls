(* Exact check for the finite skeletal Fibonacci fusion table. *)

ClearAll[check, fusion, one, tau, labels];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 44], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

labels = {one, tau};
fusion = <|
  {one, one} -> <|one -> 1, tau -> 0|>,
  {one, tau} -> <|one -> 0, tau -> 1|>,
  {tau, one} -> <|one -> 0, tau -> 1|>,
  {tau, tau} -> <|one -> 1, tau -> 1|>
|>;

check["1 tensor 1 = 1", fusion[{one, one}][one] == 1 && fusion[{one, one}][tau] == 0];
check["1 tensor tau = tau", fusion[{one, tau}][one] == 0 && fusion[{one, tau}][tau] == 1];
check["tau tensor 1 = tau", fusion[{tau, one}][one] == 0 && fusion[{tau, one}][tau] == 1];
check["tau tensor tau = 1 plus tau", fusion[{tau, tau}][one] == 1 && fusion[{tau, tau}][tau] == 1];
check["multiplicity free", And @@ Flatten[Table[fusion[{a, b}][c] <= 1, {a, labels}, {b, labels}, {c, labels}]]];
check["tau tensor tau total multiplicity", Total[Table[fusion[{tau, tau}][c], {c, labels}]] == 2];
check["left unit skeletal law",
  And @@ Flatten[Table[fusion[{one, a}][c] == If[c === a, 1, 0], {a, labels}, {c, labels}]]];
check["right unit skeletal law",
  And @@ Flatten[Table[fusion[{a, one}][c] == If[c === a, 1, 0], {a, labels}, {c, labels}]]];
check["left unit total multiplicity",
  And @@ Table[Total[Table[fusion[{one, a}][c], {c, labels}]] == 1, {a, labels}]];
check["right unit total multiplicity",
  And @@ Table[Total[Table[fusion[{a, one}][c], {c, labels}]] == 1, {a, labels}]];

Print["all exact Fibonacci fusion-rule checks passed"];
