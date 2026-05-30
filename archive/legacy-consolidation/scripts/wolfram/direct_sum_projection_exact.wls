(* Exact checks for finite direct-sum coordinate projection/inclusion equations. *)

ClearAll[check, inclusionMatrix, projectionMatrix];

check[name_, condition_] := If[TrueQ[condition], Null,
  Print["FAILED: ", name];
  Exit[1]
];

sizes = {1, 2, 3};
offsets = Most[FoldList[Plus, 0, sizes]];
totalDim = Total[sizes];

inclusionMatrix[j_] := Module[{m = ConstantArray[0, {totalDim, sizes[[j]]}]},
  Do[m[[offsets[[j]] + k, k]] = 1, {k, sizes[[j]]}];
  m
];

projectionMatrix[i_] := Module[{m = ConstantArray[0, {sizes[[i]], totalDim}]},
  Do[m[[k, offsets[[i]] + k]] = 1, {k, sizes[[i]]}];
  m
];

inclusions = inclusionMatrix /@ Range[Length[sizes]];
projections = projectionMatrix /@ Range[Length[sizes]];

Do[
  got = projections[[i]].inclusions[[j]];
  expected = If[i == j, IdentityMatrix[sizes[[i]]],
    ConstantArray[0, {sizes[[i]], sizes[[j]]}]
  ];
  check["projection inclusion i=" <> ToString[i] <> " j=" <> ToString[j],
    got == expected],
  {i, Length[sizes]}, {j, Length[sizes]}
];

resolution = Total[Table[inclusions[[j]].projections[[j]], {j, Length[sizes]}]];
check["sum inclusion projection", resolution == IdentityMatrix[totalDim]];

flat = {
  1/2 + I/3,
  -2/5 + I/7,
  3/4 - I/6,
  5/8,
  -1/9 - 2 I/3,
  7/10 + 4 I/11
};

components = Table[projections[[i]].flat, {i, Length[sizes]}];
reconstructed = Total[Table[inclusions[[i]].components[[i]], {i, Length[sizes]}]];
check["coordinate reconstruction", FullSimplify[reconstructed == flat]];

Print["all exact direct-sum projection checks passed"];
