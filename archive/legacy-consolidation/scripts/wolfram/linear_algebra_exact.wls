(* Exact finite-matrix checks for general fine-graining/channel claims. *)

ClearAll[check, EMat, UMat, Ocoarse, Ofine, Xfine, Pcode, SquareFine, SquareWitness, I2, I3];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 48], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

EMat = {{1, 0}, {0, 1}, {0, 0}};
UMat = {{0, 1, 0}, {0, 0, 1}, {1, 0, 0}};
Ocoarse = {{2, 1 - I}, {-3 + 2 I, 1/2}};
Ofine = {{1, 2 - I, 1/4 + I/2}, {-1 + 3 I, 3/4, 2}, {1/2 - I, 1 + I/4, -2}};
Xfine = {
  {1 + I, -2 + I/2, 1/4},
  {1/2 - I, 3, -1 + 2 I},
  {2, -1/4 + I, 1 - I},
  {-1 + I/2, 3/4 - I, 5/2}
};
I2 = IdentityMatrix[2];
I3 = IdentityMatrix[3];

check["E^* E = I", ConjugateTranspose[EMat].EMat == I2];
check["U^* U = I", ConjugateTranspose[UMat].UMat == I3];
check["(U E)^*(U E) = I", ConjugateTranspose[UMat.EMat].(UMat.EMat) == I2];
check["ascending unital", ConjugateTranspose[EMat].(I3.EMat) == I2];
check[
  "ascending star preserving",
  ConjugateTranspose[EMat].(ConjugateTranspose[Ofine].EMat) ==
    ConjugateTranspose[ConjugateTranspose[EMat].(Ofine.EMat)]
];
check[
  "logical lift retract",
  ConjugateTranspose[EMat].(((EMat.Ocoarse).ConjugateTranspose[EMat]).EMat) == Ocoarse
];
Pcode = EMat.ConjugateTranspose[EMat];
check["logical lift identity is code projection", (EMat.I2).ConjugateTranspose[EMat] == Pcode];
check["code projection idempotent", Pcode.Pcode == Pcode];
check["code projection self-adjoint", ConjugateTranspose[Pcode] == Pcode];
SquareFine = ConjugateTranspose[Xfine].Xfine;
SquareWitness = Xfine.EMat;
check[
  "ascending preserves Gram-form witness",
  ConjugateTranspose[EMat].(SquareFine.EMat) == ConjugateTranspose[SquareWitness].SquareWitness
];

Print["all exact finite-matrix linear algebra checks passed"];
