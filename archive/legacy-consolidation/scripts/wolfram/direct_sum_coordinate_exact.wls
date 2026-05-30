(* Exact checks for finite direct-sum coordinate flattening. *)

ClearAll[check, coordinatePairing];

check[name_, condition_] := If[TrueQ[condition], Null,
  Print["FAILED: ", name];
  Exit[1]
];

coordinatePairing[x_, y_] := Total[Conjugate[x] y];

xComponents = {
  {1/2 + I/3},
  {-2/5 + I/7, 3/4 - I/6},
  {5/8, -1/9 - 2 I/3, 7/10 + 4 I/11}
};

yComponents = {
  {-3/7 + 2 I/9},
  {4/5 - I/8, -5/6 + 3 I/10},
  {1/12 - 7 I/13, 2/15 + 5 I/16, -6/17 + I/18}
};

sizes = Length /@ xComponents;
xFlat = Flatten[xComponents];
yFlat = Flatten[yComponents];

check["dimension additivity", Length[xFlat] == Total[sizes]];
check["flatten/unflatten x", TakeList[xFlat, sizes] == xComponents];
check["flatten/unflatten y", TakeList[yFlat, sizes] == yComponents];

a = 2/3 - I/5;
b = -4/7 + 3 I/8;
check["complex linearity",
  Flatten[a xComponents + b yComponents] == a xFlat + b yFlat
];

componentPairing = Total[MapThread[coordinatePairing, {xComponents, yComponents}]];
flatPairing = coordinatePairing[xFlat, yFlat];
check["pairing preservation", FullSimplify[componentPairing == flatPairing]];

Print["all exact direct-sum coordinate checks passed"];
