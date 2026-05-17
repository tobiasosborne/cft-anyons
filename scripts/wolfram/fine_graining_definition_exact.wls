(* Exact finite-matrix checks for the fine-graining structure. *)

ClearAll[check, EMat, rho, FMat, GMat, Ofine, I2, I3, Pcode];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

EMat = {{1, 0}, {0, 1}, {0, 0}};
rho = {{3/5, 1/10 - I/5}, {1/10 + I/5, 2/5}};
FMat = {{1 + I, 2}, {-1/2, 1/4 - I}};
GMat = {{-1 + I/2, 3/4}, {2 - I, -1/4 + I}};
Ofine = {{1, 2 - I, 1/2 + I}, {-1 + I, 3, 1/4}, {2 - I, -1/2 + 2 I, 1}};
I2 = IdentityMatrix[2];
I3 = IdentityMatrix[3];
Pcode = EMat.ConjugateTranspose[EMat];

check["fine-graining isometry E^*E", ConjugateTranspose[EMat].EMat == I2];
check["ascending unital from structure", ConjugateTranspose[EMat].(I3.EMat) == I2];
check[
  "postcompose Gram preservation",
  ConjugateTranspose[EMat.FMat].(EMat.GMat) == ConjugateTranspose[FMat].GMat
];
check[
  "state embedding trace preservation",
  Tr[(EMat.rho).ConjugateTranspose[EMat]] == Tr[rho]
];
check[
  "expectation preservation",
  Tr[((EMat.rho).ConjugateTranspose[EMat]).Ofine] ==
    Tr[rho.(ConjugateTranspose[EMat].(Ofine.EMat))]
];
check[
  "ascending star preservation",
  ConjugateTranspose[EMat].(ConjugateTranspose[Ofine].EMat) ==
    ConjugateTranspose[ConjugateTranspose[EMat].(Ofine.EMat)]
];
check[
  "logical lift identity",
  (EMat.I2).ConjugateTranspose[EMat] == Pcode
];
check[
  "logical lift retract",
  ConjugateTranspose[EMat].(((EMat.rho).ConjugateTranspose[EMat]).EMat) == rho
];
check["range projection idempotent", Pcode.Pcode == Pcode];
check["range projection self-adjoint", ConjugateTranspose[Pcode] == Pcode];

Print["all exact fine-graining definition checks passed"];
