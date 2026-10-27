# H3 graph checks

Pillar P4: test the reusable all-carrier quadratic estimate in a declared
source-modified complex CAR calibration. The general theorem and its proof
are in `graph_certificate.md`; finite sampled values do not prove its rates.
No network access or commits were used. All files are confined to H3.

From `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/`:

```bash
python3 checks/graph_check.py > checks/graph_green.json
python3 checks/graph_check.py --mutation wrap > checks/mutation_wrap.txt 2>&1
python3 checks/graph_check.py --mutation normal-order > checks/mutation_normal-order.txt 2>&1
python3 checks/graph_check.py --mutation energy > checks/mutation_energy.txt 2>&1
```

Acceptance, 2026-10-27: GREEN command exited 0 (under one second).
Each mutation exited **1** at its intended invariant:

- `wrap`: a forbidden UV edge appears.
- `normal-order`: the zero mode no longer annihilates the sea vacuum.
- `energy`: the exact linear-energy mode shift fails for the sine control.

The sparse CAR check includes every excitation occupation at M=4 and M=8
(16 and 256 states), every bracket m,n in [-2,2], adjoint pairing,
normal-order Schwinger identity, and complete coarse-carrier refinement
columns for M=4→8 and M=8→16. It constructs no many-body dense
diagonalization. Float64 absolute assertion tolerance is `2e-10`.

Headline: A3 fails at p=1 by a UV lower bound tending to
`2(sqrt(2)-1)/pi=0.2636965437895248`; the fixed vacuum-pair direction has
`||T_-2 Omega||→1/sqrt(2)`. Analytic proof establishes p>1, with smallest
integer p=2: A3 O(epsilon), all-bracket A4 O(epsilon²).
The fixed diagonal witness `(Omega+w)/sqrt(2)` has
`<v,T_-2 K^-1 v> >= 1/(2sqrt(2)pi)` at every M>=4.

Independent review and exact non-collapse checks, from the same directory:

```bash
python3 checks/graph_review_check.py > checks/graph_review_check.json
python3 checks/noncollapse_symbolic.py > checks/noncollapse_symbolic_green.txt
python3 checks/noncollapse_symbolic.py --mutate > checks/noncollapse_symbolic_red.txt 2>&1
python3 checks/same_system_check.py > checks/same_system_green.json
python3 checks/same_system_check.py --mutate > checks/same_system_red.txt 2>&1
```

The first, second and fourth commands exit **0**. The two mutations exit
**1**: the non-collapse mutation changes the level-two cross-Gram coefficient
from 6h to 5h; the same-system mutation reverses the Wilson-limit covariance
sign. They are rejected by independent Gram and fixed-spinor state oracles.

`graph_review_check.py` verifies 224 saturated signed row/column Schur
bounds, eight physical CAR generator refinement squares (including filled
negative labels), and 65,856 global scalar bracket majorants, with real
exponents alpha=0.5,1,2. Float64 tolerance: `2e-10`. It constructs no dense
many-body matrix over 256 states. `noncollapse_symbolic.py` uses exact
SymPy arithmetic. `same_system_check.py` uses Complex128 and tolerance
`2e-12`, at M=8,16,32 (one-particle matrices of dimension at most 128 in
the refinement square). All runs take seconds or less.

Headline of the state check: the actual finite Dirac covariances have nonzero
chiral mixing, while their limiting row covariances split exactly into the
two complementary seas. Thus the common representation proof in
`same_system.md` uses the actual Wilson limit and does not identify finite
Dirac vacuum vectors with the exactly compatible chiral sea.

Skeptical verdicts are in `noncollapse_review.md` and `graph_review.md`.
The positivity-only central-charge implication remains unproved, with its
precise missing domain lemma recorded in the former. Review scripts and raw
outputs supplement, rather than replace, the all-scale mathematical proofs.
