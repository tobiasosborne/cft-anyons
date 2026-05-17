(* Exact finite-matrix tensor-product isometry checks. *)

ClearAll[check, E1, E2, E3, E4, K, K3, K4, U3, U4, D3, D4];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 56], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

E1 = {{1/Sqrt[2], 0}, {I/Sqrt[2], 0}, {0, 1}};
E2 = {{1/Sqrt[3]}, {I/Sqrt[3]}, {1/Sqrt[3]}};
E3 = {{3/5, -4/5}, {4/5, 3/5}};
E4 = {{1, 0}, {0, 3/5}, {0, 4/5}};
K = KroneckerProduct[E1, E2];
K3 = KroneckerProduct[K, E3];
K4 = KroneckerProduct[K3, E4];
U3 = Reverse[IdentityMatrix[Length[K3]]];
U4 = Reverse[IdentityMatrix[Length[K4]]];
D3 = U3.K3;
D4 = U4.K4;

check["first factor isometry", ConjugateTranspose[E1].E1 == IdentityMatrix[2]];
check["second factor isometry", ConjugateTranspose[E2].E2 == IdentityMatrix[1]];
check["third factor isometry", ConjugateTranspose[E3].E3 == IdentityMatrix[2]];
check["fourth factor isometry", ConjugateTranspose[E4].E4 == IdentityMatrix[2]];
check["three-factor dressing unitary", ConjugateTranspose[U3].U3 == IdentityMatrix[Length[K3]]];
check["four-factor dressing unitary", ConjugateTranspose[U4].U4 == IdentityMatrix[Length[K4]]];
check["Kronecker product isometry", ConjugateTranspose[K].K == IdentityMatrix[2]];
check["three-factor heterogeneous Kronecker isometry",
  ConjugateTranspose[K3].K3 == IdentityMatrix[4]];
check["dressed three-factor Kronecker isometry",
  ConjugateTranspose[D3].D3 == IdentityMatrix[4]];
check["four-factor heterogeneous Kronecker isometry",
  ConjugateTranspose[K4].K4 == IdentityMatrix[8]];
check["dressed four-factor Kronecker isometry",
  ConjugateTranspose[D4].D4 == IdentityMatrix[8]];

Print["all exact tensor isometry checks passed"];
