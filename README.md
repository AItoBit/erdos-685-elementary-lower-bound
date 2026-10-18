# Distinct prime divisors of central binomial coefficients

This package formalizes the classical asymptotic

`omega(binomial(2n,n)) * log n / n -> log 4`.

Here `omega` counts distinct prime divisors. The selected theorem is
`Erdos685Research.tendsto_omega_centralBinom`. The proof combines the known
prime-power bound with a prime-factor cutoff and elementary logarithmic
limits. It uses neither the prime number theorem nor unproved analytic axioms.
See [the full proof and source correspondence](MATHEMATICS.md).

This is the central specialization of Theorem 2 in
[Xylouris, arXiv:0709.4676v1](https://arxiv.org/abs/0709.4676v1), attributed
there to Erdos (1979). The contribution is its Lean formalization. No new
mathematical theorem or solution of the uniform conjecture in problem 685 is claimed.

The earlier version proved only the elementary finite lower bound. The
withdrawn private submission was declined for insufficient research interest
and missing provenance. The new selected result is a complete asymptotic,
with prior work identified in `formalization.yaml`. Registration suitability
remains a separate editorial decision.

The earlier Formal Conjectures lower-bound statement is
[`Erdos685.erdos_685.variants.trivial_lower_bound`](https://github.com/google-deepmind/formal-conjectures/blob/9cf29323ff74a2292d32006e9e3fdf23d4cf6dd2/FormalConjectures/ErdosProblems/685.lean),
by The Formal Conjectures Authors (Apache-2.0). The present asymptotic theorem
is different from that existing textbook statement.

Lean 4.35.0-rc2, Mathlib `065356127b1dc0016f66b7283ce0ce2c4055aa55`.

```sh
lake exe cache get
lake --wfail build Solution Challenge Asymptotic
```

[Hosted proof and axiom audit](https://github.com/AItoBit/erdos-685-elementary-lower-bound/actions/runs/39118373536) passed at
`c78615e8145a281882ba4bc301750bb5c2e8ad35`. The final theorem depends only on `propext`,
`Classical.choice`, and `Quot.sound`. `Challenge.lean` contains the deliberate
comparison hole and is never imported by the solution.

AItoBit directed the work and accepts maintenance responsibility. Codex
agents implemented the proof and performed independent mathematical/source
audits. No manual human proof generation or human expert review is claimed.
Broader literature coverage remains incomplete; this package makes no
exhaustive literature-search or mathematical novelty claim.

Recorded corpus: 5 discovered, 4 screened, 2 fully reviewed, 2 used in proof.
The arXiv subset has counts 2 / 2 / 1 / 1. The broader 100-paper
campaign remains incomplete; these counts do not certify novelty.
