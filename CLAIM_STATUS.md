# Erdős 685: claim status

The original uniform pointwise asymptotic remains unresolved by this work.
The supplied two-page forum printout is not a complete solution manuscript.
Neither a finite inequality nor density-one normal order settles the main
two-parameter pointwise conjecture.

| Claim | Exact scope | Evidence and limit |
|---|---|---|
| Main asymptotic | Every fixed `ε > 0`, uniformly for every `n^ε < k ≤ n^(1-ε)` as `n → ∞` | No complete proof identified or constructed in this audit. |
| Polylogarithmic strengthening | Needs an explicit upper range away from `n` | Not proved. Without such a restriction the literal assertion is false at `k=n-1`. |
| Finite logarithmic lower bound | For natural `0 < k < n`, `log(binomial(n,k))/log n ≤ ω(binomial(n,k))` | Existing elementary consequence of Kummer's formula; theorem `Erdos685.trivial_lower_bound`. CI run 39102781308 succeeded at commit `274c39e15184b9f8f9a022087f03726b701bed19`; see `VERIFICATION.txt` for the build and axiom record. This routine corollary did not satisfy Palomar's research-interest review. |
| Younis upper subrange | Fixed `0 < δ < 13/60`, uniformly for `n^(17/30+δ) ≤ k ≤ n^(1-δ)` | `UPPER_RANGE_PROOF.md` proves additive error `O_δ(k/log n)` and relative error `O_δ(1/log n)` from Younis Theorem 1.1, Chebyshev and Mertens. Independently audited mathematically; not Lean verified or implemented by the finite candidate. |
| Weatherhead normal orders | Density one for each fixed power or admissible slowly varying choice of `k(n)` | Different quantifiers from the main problem. Paper Sections 1 and 6 and selected Lean interfaces inspected; no full independent proof audit. |
| Weatherhead EGK second moment | For each fixed `α > 1`, a sum over `k ≤ n ≤ k^α`, with `k → ∞` | Claimed in the source; its Lean development relies on named custom mathematical axioms. Not a standard-three-axiom proof certificate or a pointwise solution. |

The finite candidate deliberately uses `≤`, correcting the general strict
inequality in the webpage's supplementary remark. Equality at `k=1` and
prime-power `n` makes the strict form false. It counts distinct prime
divisors, preserving the original `ν`/modern `ω` meaning.

The independent audit of `UPPER_RANGE_PROOF.md` checked the nonempty exponent
range, uniform substitution `x=n-k`, `h=y=k`, every Younis hypothesis,
the exact one-large-prime smoothness correspondence, global floor errors,
the strict upper endpoint, the small-prime error, and the uniform positive
size of the main term. The stronger additive error asserted there follows
from those estimates. This verifies the stated application of the published
analytic theorem; it does not re-prove Younis's theorem or supply a Lean proof.

The candidate standalone package is
`C:/Users/Usuario/Downloads/erdos/erdos-685-elementary-lower-bound`.
Its `formalization.yaml` passed validation against official v0.4 schema commit
`99c678e569c7c4c0772db297c5ddd5e4c9b6322e` when inspected. That is a metadata
check, not proof validation. Actual verification status belongs in that
package's final verification record. The later private Palomar review dated
18 October 2026 reported mechanical verification passed and declined
registration on research-interest grounds. The missing prior-formalization
reference has been repaired; the research-interest objection remains
unresolved. See `REVIEW_RESPONSE.md`.

`papers.jsonl` and `corpus-audit.json` record four discovered works, three
screened works, one fully read work and one source used for the finite Lean
candidate. The arXiv subset has one discovered and screened work, with no
full-paper reading. The 100-paper quota has not been met and the research
campaign is not marked complete. A retrieved PDF is not counted as read.
