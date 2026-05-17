(* Exact checks for finite orthogonal direct-sum coordinate inclusions. *)

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
ranges = Table[inclusions[[i]].projections[[i]], {i, Length[sizes]}];

Do[
  check["inclusion isometry i=" <> ToString[i],
    ConjugateTranspose[inclusions[[i]]].inclusions[[i]] ==
      IdentityMatrix[sizes[[i]]]
  ];
  check["projection is inclusion adjoint i=" <> ToString[i],
    ConjugateTranspose[inclusions[[i]]] == projections[[i]]
  ];
  check["range idempotent i=" <> ToString[i], ranges[[i]].ranges[[i]] == ranges[[i]]];
  check["range self-adjoint i=" <> ToString[i],
    ConjugateTranspose[ranges[[i]]] == ranges[[i]]
  ],
  {i, Length[sizes]}
];

ambientVector = {1 + 2 I, -3 + I, 5/2 - 4 I, 7, -2 - 3 I, 11/3 + I/2};

Do[
  componentVector = Table[k + (i + k) I, {k, sizes[[i]]}];
  check["adjoint pairing i=" <> ToString[i],
    Conjugate[inclusions[[i]].componentVector].ambientVector ==
      Conjugate[componentVector].(projections[[i]].ambientVector)
  ];
  check["range self-adjoint pairing i=" <> ToString[i],
    Conjugate[ranges[[i]].ambientVector].ambientVector ==
      Conjugate[ambientVector].(ranges[[i]].ambientVector)
  ],
  {i, Length[sizes]}
];

Do[
  If[i != j,
    check["orthogonal ranges i=" <> ToString[i] <> " j=" <> ToString[j],
      ranges[[i]].ranges[[j]] == ConstantArray[0, {totalDim, totalDim}]
    ]
  ],
  {i, Length[sizes]}, {j, Length[sizes]}
];

Print["all exact orthogonal direct-sum coordinate checks passed"];
