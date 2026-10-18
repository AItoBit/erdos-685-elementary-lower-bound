# Elementary lower bound for Erdős problem 685

Verified proof package for the known finite bound

`log (n.choose k) / log n ≤ ω (n.choose k)` for `0 < k < n`.

Here `ω` counts distinct prime divisors. The main uniform asymptotic
conjectures remain open and are not proved by this theorem. No mathematical
novelty is claimed. The intended contribution fills the existing textbook
proof placeholder in Formal Conjectures, rather than duplicating its already
merged statement formalization.

Each full prime-power block in the binomial coefficient is at most `n`, by
Mathlib's Kummer-based `Nat.pow_factorization_choose_le`. Multiplying the
blocks gives `n.choose k ≤ n ^ ω (n.choose k)`. Positivity of `log n` and
monotonicity of log yield the result. The non-strict inequality is essential:
`n=2, k=1` is an equality case, so the strict inequality in the original remark
cannot hold throughout the stated domain.

Lean 4.35.0-rc2, Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55.

```
lake exe cache get
lake --wfail build Solution Challenge
```

The strict build and final axiom audit passed in [CI run 39102781308](https://github.com/AItoBit/erdos-685-elementary-lower-bound/actions/runs/39102781308). `Challenge.lean` has one deliberate
comparison hole and is not imported by Solution. The proved solution may use
only `propext`, `Classical.choice`, and `Quot.sound`.

AItoBit directed the task and accepts maintenance responsibility. Codex agents
generated the proof and performed an independent mathematical/source audit.
No manual human proof generation or human expert review is claimed.

Source: Paul Erdős, *Some unconventional problems in number theory*, Acta
Math. Acad. Sci. Hungar. 33 (1979), 71–80, page 77, equation (9),
[DOI](https://doi.org/10.1007/BF01903382).

The source audit screened three of four discovered works and records one
full-text reading and one finite-proof source. Its arXiv subset has one
screened work and no full-text readings. The 100-paper research campaign is
incomplete. See SOURCES.md and the corpus audit for exact reading limits.
