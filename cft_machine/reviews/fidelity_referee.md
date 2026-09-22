# Independent skeptical referee: graph-norm Virasoro transport

Reviewed: `cft_machine/research/virasoro_routes.md`, VR-1 and VR-2,
2026-09-22. Reviewer: realisation/fidelity research agent, independent of the
note's author. This review does not assess or approve my own realisation note.

Verdict: **VR-1 is valid as a conditional mathematical theorem under A1–A4.**
I found no blocking gap in the regularity spaces, operator-product limits,
central residual limit, or adjoint pairing. This verdict is neither a claim
that a proposed lattice model satisfies A1–A4 nor a full CFT construction.

## Checks that could have invalidated the theorem

1. **Completion might lose injectivity.** Lines 84–97 handle this correctly.
   Exact intertwining by isometries, with positive self-adjoint K_N, makes
   each earlier space reducing. The orthogonal increments give a common
   block decomposition, so the weighted completions embed injectively into
   H_0. Merely asserting continuous embedding without that decomposition
   would not have sufficed. P_N is contractive in every graph norm and
   converges strongly there. Density of the smooth intersection follows
   because each finite block lies in every graph space.

2. **Strong limits might fail to preserve products.** Lines 118–136 use the
   necessary hierarchy of spaces rather than multiply strong limits of
   unbounded operators in H_0. I checked the two-factor defect explicitly:
   writing A,B for the two modes at successive scales, it is
   `A_f(B_f J-J B_c)+(A_f J-J A_c)B_c`.
   Its graph-norm bound is exactly
   `C_(A,s)e_(B,s+1)+e_(A,s)C_(B,s+1)`.
   This agrees with the claimed general E_(N,w,s); each additional factor
   consumes one graph degree. Finite word length makes the sum of products
   of fixed constants and summable errors summable. The proof's strong
   limit identity, used between those graph spaces, identifies the limit
   with the word in the limiting modes.

3. **The coarse-vector tail estimate might omit projection error.** Lines
   111–115 and 134–135 explicitly add the missing `(1-P_N)v` term for a
   general vector. On a vector from H_N this term vanishes. The numerical
   value of that vector-dependent projection term still needs control in
   an executable application; the theorem only proves it tends to zero.

4. **The central term might be lost under corner embeddings.** Lines
   139–141 correctly replace the finite identity by P_N and use strong
   convergence P_N→1. The residual bound A4 acts on all graph-controlled
   vectors, so its embedded residual tends to zero on H_(s+2). This is much
   stronger than a vacuum expectation or vacuum-null statement. VR-2's
   explicit two-dimensional example correctly demonstrates the distinction.

5. **Adjoint pairing might be mistaken for self-adjoint generators.** Lines
   142–145 and 172–175 explicitly prevent this inference. Finite microscopic
   adjoints and strong convergence on the common smooth domain prove only
   the displayed pairing. Positive energy, essential self-adjointness,
   exponentiation, locality and modular fidelity are not established.

6. **Exact K compatibility might be inconsistent.** It is restrictive, but
   mathematically consistent: its block construction is explicit. It need
   not be physical energy, and the note says so at lines 57–59 and 166–170.
   A concrete application must still establish uniform mode bounds and
   summable defects relative to this K. Choosing K after seeing a finite
   matrix run does not certify them for all scales.

## Suggested nonblocking clarification

Replace the phrase about cancelling intermediate refinement maps at
lines 126–128 by the direct telescoping identity for the r-factor word:
insert one refinement J between a fine prefix and a coarse suffix, and move
that interface through the r factors. This avoids any suggestion that
JJ* is the identity. The current text already offers this direct approach
and invokes J*J only where appropriate, so the present proof is sound.

## Source audit and scope

`literature/md/2306.16063/2306.16063.md:350–360` really does state bounded
asymptotic-intertwining and composition results. VR-1 explicitly calls its
own graph-norm and summability argument a local derivation, not a theorem
quoted from that source. No source claim is being used to hide the domain
argument. Full correctness of a physical compiler requires independent
verification of its certificate hypotheses and the remaining CFT axioms.
