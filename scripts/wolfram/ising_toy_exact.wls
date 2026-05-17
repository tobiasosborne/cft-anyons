(* Exact checks for the secondary Ising/TL toy block. *)

ClearAll[check, one, sigma, epsilon, labels, fusion, t];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

labels = {one, sigma, epsilon};
fusion = <|
  {one, one} -> <|one -> 1, sigma -> 0, epsilon -> 0|>,
  {one, sigma} -> <|one -> 0, sigma -> 1, epsilon -> 0|>,
  {one, epsilon} -> <|one -> 0, sigma -> 0, epsilon -> 1|>,
  {sigma, one} -> <|one -> 0, sigma -> 1, epsilon -> 0|>,
  {epsilon, one} -> <|one -> 0, sigma -> 0, epsilon -> 1|>,
  {sigma, sigma} -> <|one -> 1, sigma -> 0, epsilon -> 1|>,
  {sigma, epsilon} -> <|one -> 0, sigma -> 1, epsilon -> 0|>,
  {epsilon, sigma} -> <|one -> 0, sigma -> 1, epsilon -> 0|>,
  {epsilon, epsilon} -> <|one -> 1, sigma -> 0, epsilon -> 0|>
|>;

check["sigma tensor sigma = one plus epsilon",
  fusion[{sigma, sigma}][one] == 1 &&
  fusion[{sigma, sigma}][epsilon] == 1 &&
  fusion[{sigma, sigma}][sigma] == 0
];
check["sigma tensor epsilon = sigma", fusion[{sigma, epsilon}][sigma] == 1];
check["epsilon tensor sigma = sigma", fusion[{epsilon, sigma}][sigma] == 1];
check["epsilon tensor epsilon = one", fusion[{epsilon, epsilon}][one] == 1];
check["multiplicity free",
  And @@ Flatten[Table[fusion[{a, b}][c] <= 1, {a, labels}, {b, labels}, {c, labels}]]
];
check["sigma sigma total multiplicity",
  Total[Table[fusion[{sigma, sigma}][c], {c, labels}]] == 2
];

check["Delta_epsilon - 2 Delta_sigma = 3/4", 1 - 2*(1/8) == 3/4];
check["toy normalisation",
  FullSimplify[
    ((1/Sqrt[2])^2 + (1/Sqrt[2])^2 + (t/2)^2)/(1 + t^2/4) == 1,
    t ∈ Reals
  ]
];

Print["all exact Ising toy checks passed"];
