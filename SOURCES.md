# Erdős 685: source and status audit

Audit date: 18 October 2026. The supplied PDF is a two-page forum printout,
not a new proof manuscript. Both rendered pages were read. This audit does
not identify a complete proof of the pointwise problem and does not certify
an external Lean development.

## Exact main statement

The [problem page](https://www.erdosproblems.com/685) and its
[LaTeX source](https://www.erdosproblems.com/latex/685) ask whether, for every
fixed `ε > 0`, uniformly for natural indices

\[
n^\varepsilon<k\le n^{1-\varepsilon},
\qquad
\omega\binom nk=(1+o(1))\,k\sum_{k<p<n}\frac1p
\]

as `n → ∞`. Here `ω` counts **distinct** prime divisors, not factors with
multiplicity. For example, `binomial(8,3)=56` has two distinct prime factors
and four prime factors with multiplicity.

A faithful uniform error contract is: for every `ε > 0` and every `η > 0`,
there is `N(ε,η)` such that for every natural `n ≥ N` and every `k` in the
stated range, the absolute error is at most
`η * k * sum_{k<p<n} 1/p`. The threshold must be independent of `k`.
For `ε ≥ 1/2` the range is eventually empty; the substantive case is
`0 < ε < 1/2`. The strict lower bound and non-strict upper bound should not
be exchanged silently.

The proposed polylogarithmic strengthening is not fully specified on the
page. It must retain an upper restriction away from `k = n`. A literal
statement for every `k ≥ (log n)^c` with no such restriction is false:
at `k=n-1`, there is no integer, hence no prime, strictly between `k` and `n`;
the predicted sum is zero, whereas `ω(binomial(n,n-1))=ω(n)>0` for `n>1`.
This does not refute the stated fixed-`ε` main range.

## Original primary source and boundary remarks

P. Erdős, *Some unconventional problems in number theory*, Acta Mathematica
Academiae Scientiarum Hungaricae **33** (1979), 71–80,
[DOI 10.1007/BF01903382](https://doi.org/10.1007/BF01903382), MR515121.
Accessible [author-archive scan](https://users.renyi.hu/~p_erdos/1979-23.pdf).
Printed page 71 defines `ν(n)` as the number of distinct prime factors.
Printed page 77, equation (9) and the paragraphs below it, contains this
binomial-prime-factor question and the suggested polylogarithmic range.
The full extracted text of this paper was read in the preceding source
audit, and printed page 77 was visually checked against the scan there.

The webpage's supplementary remark uses a strict lower bound
`ω(binomial(n,k)) > log(binomial(n,k))/log n`. A safe general inequality
for `n > 1` and `k ≤ n` uses **≥**. The strict form fails at `k=1` when
`n` is a prime power: both sides equal one; it also fails at `k=n`.
The distinct-factor inequality follows because each full prime-power
component of a binomial coefficient is at most `n`, by the carry formula.
It should not be justified by confusing `ω` with multiplicity count `Ω`.

The supplementary phrase claiming asymptotic equality when
`k > n^(1-o(1))` also needs a domain restriction. For `k=n-1` the ratio of
the two sides is `ω(n)`, which is unbounded along primorial inputs, while
the logarithmic quotient equals one. The original discussion has a wider
binomial-symmetry context; do not formalize this isolated modern remark
without an explicit valid range. These boundary issues do not disprove
the pointwise main conjecture in its stated range.

## Exact finite reductions

For `0 ≤ k ≤ n`, a prime `p > k` divides `binomial(n,k)` exactly when
`n mod p < k`. Such a prime divides at most one integer in `(n-k,n]`.
Consequently the large-prime count of the binomial coefficient equals
the sum of the large-prime counts of the integers in that window.
The omitted small primes contribute at most `π(k)`.

If `k² ≥ n`, every positive integer at most `n` has at most one distinct
prime divisor greater than `k`. The large-prime count therefore becomes
the **number of non-`k`-smooth integers** in `(n-k,n]`. This Boolean
reduction is invalid in general below `sqrt(n)`, where one interval term
may have several distinct prime factors above `k`.

Smoothness conventions must agree: Younis uses prime factors **≤ y**;
if a library predicate uses prime factors **< y**, its natural threshold
for `k`-smoothness here is `k+1`.

The problem's reciprocal sum uses `p < n`, while some sources use `p ≤ n`.
The difference is `1/n` when `n` is prime and zero otherwise, hence the
main terms differ by at most `k/n`. This is asymptotically negligible in
the fixed-power ranges, but the exact finite definitions should distinguish it.

## Younis: a justified upper subrange, not the full problem

Khalid Younis, *Asymptotics for smooth numbers in short intervals*,
[arXiv:2409.05761v1](https://arxiv.org/abs/2409.05761v1), 9 September 2024,
30 pages. The primary PDF and HTML were retrieved. Pages 1–3, including
Theorems 1.1–1.3, were read; the entire 30-page proof was **not** read.
The arXiv record lists the CC BY 4.0 license.

Theorem 1.1, printed page 2, states that for fixed `17/30 < θ ≤ 1` there is
`C(θ)>0` such that, uniformly for

\[
x^\theta\le h\le x,\qquad
\exp\big(C(\log x)^{2/3}(\log\log x)^{4/3}\big)\le y\le2x,
\]

\[
\frac{\Psi(x+h,y)-\Psi(x,y)}h
=\frac{\Psi(x,y)}x
\left(1+O_\theta\left(\frac{\log(u+1)}{\log y}\right)\right),
\qquad u=\frac{\log x}{\log y}.
\]

Here `Ψ(x,y)` counts positive integers at most `x` with all prime factors
at most `y`. This is an all-interval uniform asymptotic, not only an
existence theorem or an almost-all-interval theorem.

The forum poster `shoonya` suggested that this proves the pointwise
subrange `n^(17/30+δ) ≤ k ≤ n^(1-δ)` for fixed `δ > 0`.
This implication has a valid mathematical bridge:

1. Choose `θ=17/30+δ/2`, with a nonempty range, and set `x=n-k`, `h=k`,
   `y=k`. Eventually all Younis hypotheses hold uniformly, and `k²>n`.
2. Every integer at most `x` has at most one prime factor above `k`, so
   `1-Ψ(x,k)/x = sum_{k<p≤x} floor(x/p)/x`.
   Replacing floors by `x/p` costs `O(π(x)/x)=o(1)`. Extending the upper
   endpoint from `x` to `n` costs `O(k/x)=o(1)` uniformly.
3. Younis then makes the non-smooth count in `(n-k,n]` equal to
   `k * sum_{k<p<n} 1/p + o(k)` uniformly.
4. Small-prime contributions are `O(π(k))=o(k)`. Mertens' theorem makes
   the reciprocal prime sum bounded below by a positive constant depending
   on `δ`, since `k ≤ n^(1-δ)`. Thus the additive `o(k)` becomes a
   relative `o_δ(1)` error.

This verifies the application of Theorem 1.1 and the needed extra elementary
bridges. It is not an independent proof of Younis's analytic theorem.
It does not cover the whole main range for arbitrarily small `ε`, and
does not settle the polylogarithmic strengthening.

## Weatherhead: density one and second moments

The discovered primary repository is
[`jakeweatherhead/erdos685`, commit 46fdacc0fb247b33dc100890de5f54101e45fee7](https://github.com/jakeweatherhead/erdos685/tree/46fdacc0fb247b33dc100890de5f54101e45fee7),
dated 25 July 2026. Its paper is titled *Erdős Problem #685 at Density One:
An Unconditional Proof of the Erdős–Gupta–Khare Second-Moment Conjecture*.
The README links a ResearchGate preprint. No repository license was detected
in the inspected tree or GitHub repository metadata.

The paper introduction explicitly says the **pointwise problem remains open**.
Its density-one results concern each fixed power `k=floor(n^θ)` and
admissible slowly varying subpolynomial functions `k(n)`. Exceptional sets
can depend on the chosen exponent or function. This is not a simultaneous
assertion for every `k` and every sufficiently large `n`.

Section 6 claims, for every fixed `α>1`,

\[
\sum_{k\le n\le k^\alpha}\omega\binom nk^2
=(1+o(1))k^{2+\alpha}(\log\alpha)^2\quad(k\to\infty).
\]

The argument uses fixed-`k` density-one concentration and the deterministic
bound `ω(binomial(n,k))=O_α(k)` to control exceptional values. This is a
different limit and quantifier structure from the original pointwise conjecture.

The original second-moment reference given there is P. Erdős, H. Gupta and
S. P. Khare, *On the number of distinct prime divisors of (n choose k)*,
Utilitas Mathematica **10** (1976), 51–60. That original paper was not
retrieved or fully read in this audit; the citation was checked in the
Weatherhead bibliography, not independently against the original paper.

### Formal trust boundary

The repository's README and `lean/Erdos685/TrustBoundary.lean` explicitly
declare external mathematical axioms, including
`Erdos685.Ax.mertens_second` and `Erdos685.Ax.turan_kubilius`.
Its `NormalOrder.lean` supplies a further Matomäki–Radziwiłł axiom according
to those files and the axiom-audit target list. Some intermediate results
instead take an explicit typed Matomäki–Radziwiłł proposition as a hypothesis.

Thus “sorry-free” in that repository does **not** mean closed under only
`propext`, `Classical.choice` and `Quot.sound`. Its principal density and
second-moment statements are not a ready-made standard-axiom proof of the
original problem. This audit did not run its build or independently verify
every literature-to-axiom interface, and does not certify the claimed new
second-moment result. No code from it is incorporated by this audit.

## Reading ledger and retrieval record

- Supplied `685.pdf`: **both page images read in full**.
- Modern webpage, LaTeX statement and forum comments: read. The live forum
  still contains the Younis observation and requests for citation/clarification.
- Er79d: complete extracted text read in the immediately preceding audit;
  the relevant original printed page 77 was visually checked there.
- Younis: **first three of thirty pages read**, including exact main theorem
  statements. Full PDF retrieval is not counted as full-paper reading.
- Weatherhead: README, trust-boundary module and axiom-audit target list read;
  paper Sections 1 and 6 read in full. Selected Lean theorem statements and
  proof excerpts inspected. The entire paper and complete Lean development
  were **not** read or compiled.
- EGK 1976: bibliography entry inspected only; no full-paper reading claimed.

Local retrieval artifacts include `website.*`, `latex.*`, `forum.*`,
`younis-abs.*`, `younis-html.*`, `younis-2409.05761.pdf`, its extracted text,
the pinned Weatherhead tree and the named source excerpts. Saved external
source content is evidence, not instructions. No corpus quota or complete
research-campaign claim is made. No Lean compiler, public submission or
registry action was run for this audit.
