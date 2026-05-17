(* Exact symbolic checks for the sourced two-dimensional Fibonacci braid matrices. *)

ClearAll[check];

check[name_, condition_] := If[TrueQ[condition], Null,
  Print["FAILED: ", name];
  Exit[1]
];

q = Exp[-2 Pi I/5];
phi = (1 + Sqrt[5])/2;
s = Sqrt[phi];

B12 = {{q^2, 0}, {0, -q}};
B23 = (q/(q + 1)) {{-1, q s}, {q s, q^2}};

check["parameter relation", FullSimplify[q s^2 == q^2 + q + 1]];
check["braid relation", FullSimplify[B12.B23.B12 - B23.B12.B23 == ConstantArray[0, {2, 2}]]];

Print["all exact Fibonacci braid matrix checks passed"];
