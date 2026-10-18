# Central-binomial verification

Lean 4.35.0-rc2; Mathlib 065356127b1dc0016f66b7283ce0ce2c4055aa55.
Exact verified source commit: `2ef2575ee1092c7dc5bd6563b0b3cb75bb937ba5`.
[CI run 39118618563](https://github.com/AItoBit/erdos-685-elementary-lower-bound/actions/runs/39118618563): SUCCESS.

Command: `lake --wfail build Solution Challenge Asymptotic`.
The audit imported Asymptotic and printed the final theorem and axioms.

`'Erdos685Research.tendsto_omega_centralBinom' depends on axioms: [propext, Classical.choice, Quot.sound]`

Source fidelity and complete mathematical proof were audited independently
by separate agents. The target is Xylouris Theorem 2 with fixed parameters
2 and 1. The original uniform problem 685 is not proved.

Local compilation was unavailable because Windows exhausted paging memory.
This verification relies on the observed hosted run. The cleaned proof and selected Challenge passed the final strict build.
Subsequent commits update documentation only; the Lean sources are identical
to the verified revision. Exact-commit independent-kernel evidence belongs
to the separate Palomar preflight report.
