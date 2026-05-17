(* Exact checks for finite configuration-space coordinate direct sums. *)

ClearAll[check, configs, particleNumber, sectorSize, coordinatePairing,
  labels, n, cfgs, sizes, xComponents, yComponents, xFlat, yFlat,
  componentPairing, flatPairing, constantSectorDim];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 48], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

configs[labels_, n_Integer] := Tuples[labels, n];
particleNumber[cfg_] := Count[cfg, "tau"];
sectorSize[cfg_] := particleNumber[cfg] + 1;
coordinatePairing[x_, y_] := Total[Conjugate[x] y];

labels = {"one", "tau"};
n = 3;
cfgs = configs[labels, n];
sizes = sectorSize /@ cfgs;

check["Fibonacci configuration count", Length[cfgs] == 2^n];
check["dependent dimension sum", Total[sizes] == 20];

xComponents = Table[
  Table[(j + 2 k)/(13 + j + k) + I (j - k)/(17 + j + k),
    {k, 1, sizes[[j]]}],
  {j, 1, Length[cfgs]}
];
yComponents = Table[
  Table[(3 j - k)/(19 + j + k) + I (j + 2 k)/(23 + j + k),
    {k, 1, sizes[[j]]}],
  {j, 1, Length[cfgs]}
];

xFlat = Flatten[xComponents];
yFlat = Flatten[yComponents];

check["flatten dimension", Length[xFlat] == Total[sizes]];
check["unflatten x", TakeList[xFlat, sizes] == xComponents];
check["unflatten y", TakeList[yFlat, sizes] == yComponents];

componentPairing = Total[MapThread[coordinatePairing, {xComponents, yComponents}]];
flatPairing = coordinatePairing[xFlat, yFlat];
check["pairing preservation", componentPairing == flatPairing];

constantSectorDim = 3;
check["constant sector dimension",
  Length[cfgs] constantSectorDim == 2^n constantSectorDim
];

Print["all exact configuration-space coordinate checks passed"];
