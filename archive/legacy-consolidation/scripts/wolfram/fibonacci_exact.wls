(* Independent exact WolframScript checks for the first Fibonacci block.

   Provenance:
   - handoff.md sections 9.1, 9.3, 9.5, 9.6, 9.7
   - references/text/FibonacciAnyonModels.txt lines 216-218, 272, 297, 301, 304
   - references/text/GoldenChainFeiguinEtAl.txt line 109
*)

ClearAll[check, phi, D2, a, b, F, x, y, r, rho, u0, uI, jL, jR, uTau];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 44], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

phi = (1 + Sqrt[5])/2;
D2 = 1 + phi^2;

Print["Fibonacci exact WolframScript checks"];
check["phi^2 = phi + 1", phi^2 == phi + 1];
check["phi^-1 = phi - 1", 1/phi == phi - 1];
check["phi^-2 + phi^-1 = 1", 1/phi^2 + 1/phi == 1];
check["D^2 = 2 + phi", D2 == 2 + phi];

a = 1/phi;
b = Sqrt[1/phi];
F = {{a, b}, {b, -a}};
check["Transpose[F].F = Identity", Transpose[F].F == IdentityMatrix[2]];
check["F.F = Identity", F.F == IdentityMatrix[2]];

check["PF vacuum normalisation", 1/D2 + phi^2/D2 == 1];
check["PF tau normalisation", 1/D2 + 1/D2 + phi/D2 == 1];

ClearAll[dim, pfAmplitude];
dim["one"] = 1;
dim["tau"] = phi;
pfAmplitude[a_, b_, c_] := Sqrt[dim[b] dim[c]/(dim[a] D2)];
check["PF amp 1->11 formula",
  FullSimplify[pfAmplitude["one", "one", "one"] == 1/Sqrt[D2], phi > 0 && D2 > 0]
];
check["PF amp 1->tt formula",
  FullSimplify[pfAmplitude["one", "tau", "tau"] == phi/Sqrt[D2], phi > 0 && D2 > 0]
];
check["PF amp t->t1 formula",
  FullSimplify[pfAmplitude["tau", "tau", "one"] == 1/Sqrt[D2], phi > 0 && D2 > 0]
];
check["PF amp t->1t formula",
  FullSimplify[pfAmplitude["tau", "one", "tau"] == 1/Sqrt[D2], phi > 0 && D2 > 0]
];
check["PF amp t->tt formula",
  FullSimplify[pfAmplitude["tau", "tau", "tau"] == Sqrt[phi]/Sqrt[D2],
    phi > 0 && D2 > 0]
];

x = 1/phi;
y = 1/Sqrt[phi];
r = 1/phi^(3/2);
check["coassoc x^2 + y^2 = 1", x^2 + y^2 == 1];
check["coassoc 2x^2 + r^2 = 1", 2 x^2 + r^2 == 1];
check["coassoc F-eigen equation", r^2 == phi^(-3/2) x y];

rho = 2/5;
u0 = 3 + I;
uI = 2 - I;
jL = 5 - 2 I;
jR = -1 + 3 I;
uTau = 4 + I;
check[
  "RG vacuum normalisation",
  FullSimplify[
    (Abs[Conjugate[u0]]^2 + Abs[Conjugate[uI] rho^(-4/5)]^2)/
      (Abs[u0]^2 + Abs[uI]^2 rho^(-8/5)) == 1,
    rho > 0
  ]
];
check[
  "RG tau normalisation",
  FullSimplify[
    (Abs[Conjugate[jL]]^2 + Abs[Conjugate[jR]]^2 + Abs[Conjugate[uTau] rho^(-2/5)]^2)/
      (Abs[jL]^2 + Abs[jR]^2 + Abs[uTau]^2 rho^(-4/5)) == 1,
    rho > 0
  ]
];
tauDen = Abs[jL]^2 + Abs[jR]^2 + Abs[uTau]^2 rho^(-4/5);
tauTauProbability = Abs[Conjugate[uTau] rho^(-2/5)]^2/tauDen;
tauTauProbabilityFormula = Abs[uTau]^2 rho^(-4/5)/tauDen;
check[
  "RG tau->tautau probability formula",
  FullSimplify[tauTauProbability == tauTauProbabilityFormula, rho > 0]
];
check[
  "RG tau->tautau probability bounds",
  FullSimplify[0 <= tauTauProbabilityFormula <= 1, rho > 0]
];

betaRow = {3 + I, 2 - I, -1 + 2 I};
Srow = Total[Abs[#]^2 & /@ betaRow];
Brow = {betaRow};
Rrow = {{1/Sqrt[Srow]}};
Erow = ConjugateTranspose[Brow].Rrow;
Arow = List /@ (Conjugate[betaRow]/Sqrt[Srow]);
check["no-mixing polar entry formula", Erow == Arow];
check["no-mixing polar section isometry", ConjugateTranspose[Erow].Erow == IdentityMatrix[1]];

ClearAll[x, y, p, q, r, eta, gram];
eta = {{x, 0}, {y, 0}, {0, p}, {0, q}, {0, r}};
gram = ConjugateTranspose[eta].eta;
check[
  "binary eta Gram matrix",
  gram == {
    {Conjugate[x] x + Conjugate[y] y, 0},
    {0, Conjugate[p] p + Conjugate[q] q + Conjugate[r] r}
  }
];

etaPF = {
  {1/Sqrt[D2], 0},
  {phi/Sqrt[D2], 0},
  {0, 1/Sqrt[D2]},
  {0, 1/Sqrt[D2]},
  {0, Sqrt[phi]/Sqrt[D2]}
};
check["PF binary eta isometry", ConjugateTranspose[etaPF].etaPF == IdentityMatrix[2]];
etaPFDim = {
  {pfAmplitude["one", "one", "one"], 0},
  {pfAmplitude["one", "tau", "tau"], 0},
  {0, pfAmplitude["tau", "tau", "one"]},
  {0, pfAmplitude["tau", "one", "tau"]},
  {0, pfAmplitude["tau", "tau", "tau"]}
};
check["PF dimension-formula eta equality",
  FullSimplify[etaPFDim == etaPF, phi > 0 && D2 > 0]
];
check["PF dimension-formula eta isometry",
  FullSimplify[ConjugateTranspose[etaPFDim].etaPFDim == IdentityMatrix[2],
    phi > 0 && D2 > 0]
];

Print["all WolframScript Fibonacci checks passed"];
