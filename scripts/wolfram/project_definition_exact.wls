(* Exact checks for the finite-coordinate project definitions Q and H_N^W. *)

ClearAll[check, configs, particleNumber, sectorSize, coordinatePairing,
  labels, vacuum, n, cfgs, sizes, xComponents, yComponents, xFlat, yFlat,
  componentPairing, flatPairing];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 48], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

configs[labels_, n_Integer] := Tuples[labels, n];
particleNumber[vacuum_, cfg_] := Count[cfg, Except[vacuum]];
sectorSize[cfg_] := Count[cfg, "tau"] + 1;
coordinatePairing[x_, y_] := Total[Conjugate[x] y];

labels = {"one", "tau"};
vacuum = "one";
n = 4;
cfgs = configs[labels, n];
sizes = sectorSize /@ cfgs;

check["local occupation summands", Length[labels] == 2];
check["Q tensor N label summands", Length[cfgs] == Length[labels]^n];
check["Fibonacci Q tensor N label summands", Length[cfgs] == 2^n];
check["vacuum tensor particle number", particleNumber[vacuum, ConstantArray[vacuum, n]] == 0];
check["all-tau tensor particle number", particleNumber[vacuum, ConstantArray["tau", n]] == n];
check["H_N^W flattened dimension", Total[sizes] == Length[Flatten[Map[ConstantArray[0, #] &, sizes]]]];

xComponents = Table[
  Table[(2 j + k)/(11 + j + k) + I (j - 3 k)/(17 + j + k),
    {k, 1, sizes[[j]]}],
  {j, 1, Length[cfgs]}
];
yComponents = Table[
  Table[(j - k)/(19 + j + k) + I (4 j + k)/(23 + j + k),
    {k, 1, sizes[[j]]}],
  {j, 1, Length[cfgs]}
];

xFlat = Flatten[xComponents];
yFlat = Flatten[yComponents];

check["H_N^W unflatten x", TakeList[xFlat, sizes] == xComponents];
check["H_N^W unflatten y", TakeList[yFlat, sizes] == yComponents];

componentPairing = Total[MapThread[coordinatePairing, {xComponents, yComponents}]];
flatPairing = coordinatePairing[xFlat, yFlat];
check["H_N^W pairing preservation", componentPairing == flatPairing];

Print["all exact project definition checks passed"];
