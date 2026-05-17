(* Exact trace, square-form, and positivity checks for finite ascending channels. *)

ClearAll[check, positiveSemidefiniteQ, EMat, rho, Ofine, XMat, KMat, XBig,
  OAmp, AscAmp, KAlt, KList, OTracePos, KrausSum, KrausSumTarget,
  AmpKrausSum, AmpKrausSumTarget, ERect, YPos, OPos, AscPos];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

positiveSemidefiniteQ[M_] := Module[{n = Length[M], minors},
  minors = Flatten[
    Table[Det[M[[idx, idx]]] >= 0, {k, 1, n}, {idx, Subsets[Range[n], {k}]}]
  ];
  FullSimplify[ConjugateTranspose[M] == M && And @@ minors]
];

EMat = {{1, 0}, {0, 1}, {0, 0}};
rho = {{7/10, 1/5 - I/10}, {1/5 + I/10, 3/10}};
Ofine = {{1, 2 - I, 1/4 + I/2}, {-1 + 3 I, 3/4, 2}, {1/2 - I, 1 + I/4, -2}};
XMat = {{1 + I, 2, 0}, {-I, 3 - I, 1 + 2 I}, {2 - I, 1/2, 4}};

check[
  "state embedding trace preserving",
  Tr[(EMat.rho).ConjugateTranspose[EMat]] == Tr[rho]
];
check[
  "expectation against embedded state",
  Tr[((EMat.rho).ConjugateTranspose[EMat]).Ofine] ==
    Tr[rho.(ConjugateTranspose[EMat].(Ofine.EMat))]
];
check[
  "Kraus square form",
  ConjugateTranspose[EMat].((ConjugateTranspose[XMat].XMat).EMat) ==
    ConjugateTranspose[XMat.EMat].(XMat.EMat)
];

KMat = KroneckerProduct[IdentityMatrix[2], EMat];
XBig = {
  {1, 2 - I, 0, 1 + I, 1/2, -2},
  {-1 + I, 3, 2, 0, 1 - I, 0},
  {1/4, 1 + 2 I, -1, 2, 0, 1},
  {2, 0, -I, 1, 3 + I, 3/4},
  {0, 1, 2 - I, -1, 1/2 + I, 2},
  {1 - I, -1/2, 0, 2 + I, -1, 3}
};
check[
  "amplified Kraus square form",
  ConjugateTranspose[KMat].((ConjugateTranspose[XBig].XBig).KMat) ==
    ConjugateTranspose[XBig.KMat].(XBig.KMat)
];
OAmp = ConjugateTranspose[XBig].XBig;
AscAmp = ConjugateTranspose[KMat].(OAmp.KMat);
check[
  "amplified ascending preserves PSD",
  positiveSemidefiniteQ[AscAmp]
];
check[
  "amplified PSD congruence identity",
  AscAmp == ConjugateTranspose[XBig.KMat].(XBig.KMat)
];

KAlt = {{1/2, 1 - I}, {-1 + I/4, 3/4}, {2, I/2}};
KList = {EMat, KAlt};
OTracePos = ConjugateTranspose[XMat].XMat;
KrausSum = Total[(ConjugateTranspose[#].(OTracePos.#)) & /@ KList];
KrausSumTarget = Total[(ConjugateTranspose[XMat.#].(XMat.#)) & /@ KList];
AmpKrausSum = Total[
  (ConjugateTranspose[KroneckerProduct[IdentityMatrix[2], #]].(
      OAmp.KroneckerProduct[IdentityMatrix[2], #])) & /@ KList
];
AmpKrausSumTarget = Total[
  (ConjugateTranspose[XBig.KroneckerProduct[IdentityMatrix[2], #]].(
      XBig.KroneckerProduct[IdentityMatrix[2], #])) & /@ KList
];
check[
  "finite Kraus sum preserves PSD",
  positiveSemidefiniteQ[KrausSum]
];
check[
  "finite Kraus sum Gram identity",
  KrausSum == KrausSumTarget
];
check[
  "amplified finite Kraus sum preserves PSD",
  positiveSemidefiniteQ[AmpKrausSum]
];
check[
  "amplified finite Kraus sum Gram identity",
  AmpKrausSum == AmpKrausSumTarget
];

KNormalized = {(3/5) EMat, (4 I/5) EMat};
KNormalization = Total[(ConjugateTranspose[#].#) & /@ KNormalized];
KAscending = Total[(ConjugateTranspose[#].(Ofine.#)) & /@ KNormalized];
KState = Total[((#.rho).ConjugateTranspose[#]) & /@ KNormalized];
check[
  "finite Kraus normalization",
  KNormalization == IdentityMatrix[2]
];
check[
  "finite Kraus sum unital",
  Total[(ConjugateTranspose[#].(IdentityMatrix[3].#)) & /@ KNormalized] ==
    IdentityMatrix[2]
];
check[
  "finite Kraus sum star preserving",
  Total[(ConjugateTranspose[#].(ConjugateTranspose[Ofine].#)) & /@ KNormalized] ==
    ConjugateTranspose[KAscending]
];
check[
  "finite Kraus state trace preserving",
  Tr[KState] == Tr[rho]
];
check[
  "finite Kraus expectation preserving",
  Tr[KState.Ofine] == Tr[rho.KAscending]
];

ERect = {{1 + I, 2 - I}, {1/2, -I}, {-1, 3 + 2 I}};
YPos = {
  {1 - I, 2, 1/2 + I},
  {-2, I, 1},
  {1/4, 1 - I, 3},
  {2 + I, -1/2, 1 - 2 I}
};
OPos = ConjugateTranspose[YPos].YPos;
AscPos = ConjugateTranspose[ERect].(OPos.ERect);
check[
  "input positive semidefinite observable",
  positiveSemidefiniteQ[OPos]
];
check[
  "ascending preserves positive semidefinite",
  positiveSemidefiniteQ[AscPos]
];
check[
  "PSD congruence quadratic form identity",
  AscPos == ConjugateTranspose[YPos.ERect].(YPos.ERect)
];

Print["all exact finite-matrix trace checks passed"];
