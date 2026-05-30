(* Exact checks for finite truncated distinguishable-Fock coordinates. *)

ClearAll[check, sectorDim, truncatedDim, componentVectors];

check[name_, condition_] := If[TrueQ[condition], Null,
  Print["FAILED: ", name];
  Exit[1]
];

sectorDim[localDim_, n_] := localDim^n;
truncatedDim[localDim_, maxN_] := Sum[sectorDim[localDim, n], {n, 0, maxN}];

Do[
  check["zero sector localDim=" <> ToString[localDim], sectorDim[localDim, 0] == 1];
  check["one sector localDim=" <> ToString[localDim], sectorDim[localDim, 1] == localDim];
  check["truncated count localDim=" <> ToString[localDim] <> " maxN=" <> ToString[maxN],
    truncatedDim[localDim, maxN] == Sum[localDim^n, {n, 0, maxN}]
  ],
  {localDim, 1, 5}, {maxN, 0, 7}
];

componentVectors[localDim_, maxN_] := Module[
  {cursor = 0, xs = {}, ys = {}, len, x, y},
  Do[
    len = sectorDim[localDim, n];
    x = {};
    y = {};
    Do[
      cursor += 1;
      AppendTo[x, cursor + (n + k) I];
      AppendTo[y, (2 cursor - k) - (n + 1) I],
      {k, 1, len}
    ];
    AppendTo[xs, x];
    AppendTo[ys, y],
    {n, 0, maxN}
  ];
  {xs, ys}
];

Do[
  {xs, ys} = componentVectors[localDim, maxN];
  flatX = Flatten[xs];
  flatY = Flatten[ys];
  check["flattened dimension localDim=" <> ToString[localDim] <>
      " maxN=" <> ToString[maxN],
    Length[flatX] == truncatedDim[localDim, maxN]
  ];
  check["pairing preservation localDim=" <> ToString[localDim] <>
      " maxN=" <> ToString[maxN],
    Conjugate[flatX].flatY ==
      Sum[Conjugate[xs[[n + 1]]].ys[[n + 1]], {n, 0, maxN}]
  ],
  {localDim, {2, 3}}, {maxN, {0, 1, 4}}
];

Do[
  check["Fibonacci two-label truncated count maxN=" <> ToString[maxN],
    truncatedDim[2, maxN] == Sum[2^n, {n, 0, maxN}]
  ],
  {maxN, 0, 8}
];

Print["all exact truncated Fock coordinate checks passed"];
