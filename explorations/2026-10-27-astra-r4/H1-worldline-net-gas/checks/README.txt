H1 exact finite algebra checks -- 2026-10-27

Pillars P2 (tile-to-worldline expansion, sewing, sign interpretation) and P1
(vacancy/pair reactions). Setting any; finite L0 dagger-linear algebra with
the declared conventions below; ingredients only, no continuum rung reached.

Run from repository root (all commands exited 0):
python3 explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_patch.py > explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_patch_output.txt 2>&1
python3 explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_signs.py > explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_signs_output.txt 2>&1
python3 explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_fs_instance.py > explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/fs_instance_output.txt 2>&1
python3 explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/check_anisotropy.py > explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/anisotropy_output.txt 2>&1
python3 explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/source_audit.py > explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/source_audit_output.txt 2>&1

Patch/sign raw outputs give UTC run time, exact command, Python/SymPy versions,
script SHA256, every asserted invariant, mutation witnesses and elapsed seconds.
The FS instance also records UTC/command/hash. Anisotropy output records
versions and invariant witnesses; source-audit output records the search.
Python 3.12.3 and SymPy 1.12 were used. No numerical tolerance, network,
Julia suite, or repository-global changes are involved.

Headline: exact rescaled tile expansion agrees with independent indexed
contraction, with nonorthogonal Gram sewing and the complex F^-T dual;
all five patch mutations fail the production equality invariant. D2 has
negative cup/cap coefficients but nonnegative closed-path weights; changing
only one cup sign makes a closed path negative and the positivity test fails.
The source-backed four-site FS example confirms an actual categorical
negative loop history, and sourced face weights pass a separate calibration.
Eight intentional mutations are rejected across the four invariant scripts.

check_patch.py
--------------
The two adjacent gates live in a synthetic two-channel total-charge block
of a three-factor fusion-tree presentation. r is real and the formal phase
z obeys conjugate(z)=1/z. The rational rotation F(r,z) is exactly unitary.
This is ONLY a change-of-basis algebra test. No category, fusion support,
pentagon solution, or general categorical realizability is claimed for this
arbitrary F. In a category the two trees must first exist with these labels.

Basis-ket columns are t_L=F t_R. Therefore coefficient columns change by
C=F.T, and the right gate in left coordinates is C^dagger T_R C. The
linear-dual basis column changes by F^-T=conjugate(F). This explicit
distinction prevents accidental transposes when comparing basis and
coefficient conventions.

Both densities are rational selfadjoint involutions, so their exact gates
are x P_+ + x^-1 P_- with x=exp(t) (and y=exp(u) on the second gate).
All sixteen products of the rescaled matrix-unit tile bases are included;
weights divide by the two vertex factors on each tile as in NOTE (A2).
The arbitrary positive rescalings are normalization test data; they are not
asserted to arise from categorical dimensions. An independent scalar-index
contraction agrees with both the tile sum and the direct ordered product.

The seam has synthesis U=[[1,i],[0,2]], Gram [[1,i],[-i,5]], determinant 4.
The inverse-Gram resolution is checked symbolically. Mutation witnesses
specialize r=1/2,z=i,x=2,y=3, retaining exact rational complex arithmetic.
The five mutations omit G^-1, replace the seam dagger with transpose,
replace conjugate(F) with F in the dual, replace the right-gate dagger
with transpose, and change one actual gate's t^2/2 term to t^2. Every
changed expression is passed to the same equality assertion and rejected.

check_signs.py
--------------
D2 is checked symbolically for arbitrary d>0 and s=t sqrt(d)>0 in the
vacancy/pair subspace plus an inert orthogonal complement. The raw cup
satisfies b^dagger b=d P_vv and bb^dagger=d P_pair. Its exact exponential
agrees with D2 for both selfadjoint h_+ and h_-.

At s=log(2), enumerate every identity/P_vv/cup-cap/cup/cap decorated word
of lengths one through six and every compatible closed initial state.
The 1,098 closed paths per sign have strictly positive exact weights.
Normalization cancels d, so this finite enumeration is independent of d.
The all-length reason is the asserted occupation invariant births=deaths:
each closed path has an even number of negative cup/cap factors. This
enumeration checks the two-state loop algebra, not every spatial geometry;
the general geometry argument is the occupation proof in NOTE H1-D1.

Flipping only the first gate's cup coefficient, keeping its cap coefficient,
gives a b-then-cap closed weight -9/16. This mutation breaks selfadjointness;
it tests sign detection and is not claimed to be a selfadjoint counterexample.

Additional exact algebraic calibrations:
* Symmetric and alternating raw two-dimensional cups both have norm d=2.
  Their raw snake signs are kappa=+1,-1 and their four-cup contractions are
  respectively +2,-2. This verifies D4 tensor algebra, without naming or
  claiming a categorical realization of these Hilbert-space tensors.
* Signed symmetric triangle S satisfies S^2=2I-S. The exact gate exp(tS)
  solves its ODE and equals aI+bS. At t=log(2) it has eigenvalues 2,2,1/4,
  while its closed matrix-unit triangle has weight -343/1728. Thus the
  finite seam positivity test from CA-80 does not imply positive weights
  in this fixed history presentation. No spatial-reflection or full-row
  positivity theorem is inferred from this seam-block calibration.

check_fs_instance.py
--------------------
This separate sourced categorical example closes the realizability caveat
on the synthetic raw FS tensors. Penneys:595-608,917-931,1032-1047 gives
Hilb_fd(Z/2,omega), omega(a,b,c)=(-1)^(abc), with pseudoreal simple g.
The script checks every four-group-element cocycle/pentagon and all unit
normalizations. It then embeds the six raw elementary events of NOTE (D4)
on four O=1_vac+g sites, restoring left-tree associators. The middle
annihilation has phase -1; all other phases are +1. Thus Ev=-1 and exact
geometric coefficients 3/4 give weight -729/4096. Correct oriented duality
still has snake +1. Erasing the FS phase is detected as a wrong evaluation.
This is a 16-path-space witness for a general theorem, not a target model.

check_anisotropy.py
------------------
The nine weights are copied from ZhouBatchelor1997/source/9611156.tex:120-145.
SymPy checks regularity at u=0, the u=lambda normalized ratios and the
branch identity sqrt(2-n)=2*abs(cos(2*lambda)). All denominator-zero values
are excluded. Reversing rho9's sign is invisible at u=lambda, so the
mutation is correctly tested on its derivative at u=0. No identification
of finite-u face weights with exp(t h), no row commutativity, and no
conformal-limit theorem are asserted. CA-86:273-279's erratum applies.

source_audit.py
---------------
Offline rg audit of references/ and literature/md/ text/TeX/Markdown.
Queries: Markov, loop model, O(n), CLE, Schramm, domain Markov, SLE.
Full matches include duplicate source/extraction and bibliography hits;
the NOTE distinguishes them from usable results. Search failure is not a
proof of absence. No source was acquired over the network.

Sources and dependencies
------------------------
NOTE.md H1-A (exact expansion), H1-C (sewing), H1-D1 (D2/D4/phase argument).
CONVENTIONS.md (ai), (al), (am); NOTE's local convention proposals.
report/sections/80_lattice_sewing_and_fidelity_certificate.tex:52-101.
references/text/PenneysUnitaryFusionCategories.md:528-568 (vertices/F),
:1032-1047 (raw self-duality sign). Local registration:
references/category-theory/SOURCES.md:134-147;
references/manifest/SOURCES.md:35,57.

No NOTE changes or commits were made by this check collaborator. The parent
author owns integration, the results ledger, and any required global index.
