(* Exact checks for the scalar positive coassociative solution. *)

ClearAll[check, phi, x, y, r, u, solution];

check[name_String, expr_] := Module[{ok = TrueQ[FullSimplify[expr]]},
  Print[StringPadRight[name, 52], If[ok, "PASS", "FAIL"]];
  If[!ok, Print["  expression: ", InputForm[expr]]; Exit[1]]
];

phi = (1 + Sqrt[5])/2;

check["candidate equations",
  And @@ {
    phi^(-2) + phi^(-1) == 1,
    2 phi^(-2) + phi^(-3) == 1,
    phi^(-3) == phi^(-3/2) phi^(-1) phi^(-1/2)
  }
];

check["fractional power coefficient identities",
  FullSimplify[
    And @@ {
      phi^(-1/2) == 1/Sqrt[phi],
      phi^(-3/2) == 1/(phi Sqrt[phi]),
      (phi^(-3/2))^2 == phi^(-3),
      phi^(-3/2) == Sqrt[phi^(-3)]
    },
    phi > 0
  ]
];

eta = {
  {phi^(-1), 0},
  {phi^(-1/2), 0},
  {0, phi^(-1)},
  {0, phi^(-1)},
  {0, phi^(-3/2)}
};

check["coassoc eta Gram is identity",
  FullSimplify[Transpose[eta].eta == IdentityMatrix[2]]
];

check["eliminated polynomial factorisation",
  (1 - 2 u)^2 - phi^(-3) u (1 - u) ==
    (3 + 2/phi) (u - phi^(-2)) (u - phi^(-1))
];

solution = {
  x > 0, y > 0, r > 0,
  x^2 + y^2 == 1,
  2 x^2 + r^2 == 1,
  r^2 == phi^(-3/2) x y
};

check["positive solution x",
  Resolve[ForAll[{x, y, r}, Implies[And @@ solution, x == phi^(-1)]], Reals]
];
check["positive solution y",
  Resolve[ForAll[{x, y, r}, Implies[And @@ solution, y == phi^(-1/2)]], Reals]
];
check["positive solution r",
  Resolve[ForAll[{x, y, r}, Implies[And @@ solution, r == phi^(-3/2)]], Reals]
];

Print["all exact scalar coassociative uniqueness checks passed"];
