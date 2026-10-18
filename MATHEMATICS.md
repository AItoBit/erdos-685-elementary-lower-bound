# Distinct prime divisors of central binomial coefficients

Let \(\omega(a)\) denote the number of distinct prime divisors of the positive
integer \(a\). All logarithms are natural.

**Theorem.** Along the natural numbers,
\[
\lim_{n\to\infty}\frac{\omega\!\binom{2n}{n}\log n}{n}=\log4.
\]
Equivalently,
\(\omega\binom{2n}{n}\sim (\log4)n/\log n\).

This is established mathematics. It is the specialization with fixed parameters
\(2,1\) of Theorem 2 in T. Xylouris,
[*Binomial Coefficients and the Distribution of the Primes*,
arXiv:0709.4676v1](https://arxiv.org/abs/0709.4676v1), which attributes the result
to P. Erdős, [*Some unconventional problems in number theory*, Acta Math. Acad.
Sci. Hungar. **33** (1979), 71–80](https://doi.org/10.1007/BF01903382), p.77.
The proof below uses elementary estimates and no prime number theorem.

## Proof

Put \(B_n=\binom{2n}{n}\) and \(L_n=\log B_n\).
The binomial theorem and the maximality of the central coefficient give
\[
\frac{4^n}{2n+1}\le B_n\le4^n.
\]
Taking logarithms and dividing by \(n\) shows that
\[
\frac{L_n}{n}\longrightarrow\log4. \tag{1}
\]
Here \(\log(2n+1)/n\to0\). The Lean development uses the stronger
library bound \(4^n<nB_n\), valid for \(n\ge4\), for the same squeeze.

We next recall the prime-power bound. If \(p\) is prime and \(0\le b\le a\),
then
\[
p^{v_p(\binom ab)}\le a\qquad(a>0). \tag{2}
\]
Indeed, Legendre's formula expresses the valuation as a sum over powers
\(p^j\le a\) of
\[
\left\lfloor\frac{a}{p^j}\right\rfloor-
\left\lfloor\frac{b}{p^j}\right\rfloor-
\left\lfloor\frac{a-b}{p^j}\right\rfloor.
\]
Each summand is zero or one. There are at most
\(\lfloor\log a/\log p\rfloor\) summands, proving (2).
Multiplying the prime-power components of \(B_n\) therefore yields
\(B_n\le(2n)^{\omega(B_n)}\). Consequently, for \(n>1\),
\[
\frac{L_n}{n}\frac{\log n}{\log(2n)}
\le\frac{\omega(B_n)\log n}{n}. \tag{3}
\]
The left side tends to \(\log4\) by (1) and
\(\log n/\log(2n)\to1\).

For the reverse bound, let \(B\) be any positive integer and \(T>1\).
Partition its distinct prime divisors into those at most \(T\) and those
greater than \(T\). The first group has at most \(\lfloor T\rfloor+1\le T+1\)
elements. If the second group has \(r\) elements, their product divides \(B\),
so \(r\log T\le\log B\). Thus
\[
\omega(B)\le T+1+\frac{\log B}{\log T}. \tag{4}
\]
The extra one permits the simple count by all natural numbers through
\(\lfloor T\rfloor\); it is harmless in the limit.

For all sufficiently large \(n\), choose
\[
T_n=\frac{n}{(\log n)^2}>1.
\]
The threshold is \(T_n\); the small-prime counting term in (4) is \(T_n+1\).
Applying (4) to \(B_n\) and multiplying by \(\log n/n\) gives
\[
\frac{\omega(B_n)\log n}{n}
\le\frac{(T_n+1)\log n}{n}
  +\frac{L_n}{n}\frac{\log n}{\log T_n}. \tag{5}
\]
The first term equals \(1/\log n+\log n/n\), hence tends to zero.
Also
\[
\log T_n=\log n-2\log\log n,
\qquad
\frac{\log\log n}{\log n}\longrightarrow0.
\]
It follows that \(\log n/\log T_n\to1\). By (1), the right side of (5)
tends to \(\log4\). The bounds (3) and (5) now prove the theorem by squeezing.
Every division and logarithmic comparison used above is valid eventually;
the finitely many initial indices do not affect the limit. ∎

## Scope and relation to Erdős problem 685

The open uniform question concerns \(\binom Nk\) with
\(N^\varepsilon<k\le N^{1-\varepsilon}\), for every fixed
\(\varepsilon>0\). The central family has \(N=2n\) and \(k=n=N/2\).
For every fixed positive \(\varepsilon\), this violates
\(k\le N^{1-\varepsilon}\) once \(N\) is sufficiently large.
The theorem concerns the same arithmetic statistic and gives an exact
asymptotic for a related family. It does not settle any of the missing
sublinear ranges of the uniform conjecture, and the mathematical result is
not claimed to be new.

## Source-to-Lean correspondence

The following declarations implement the clauses of the proof.
See `VERIFICATION-CENTRAL.md` for exact build and axiom evidence.

| Mathematical clause | Lean declaration or dependency |
| --- | --- |
| \(B_n=\binom{2n}{n}\) | `Nat.centralBinom_eq_two_mul_choose` |
| \(B_n>0\) | `Nat.centralBinom_pos` |
| Exponential growth (1) | `Erdos685Research.tendsto_log_centralBinom_div` in `CentralGrowth.lean`, using `Nat.four_pow_lt_mul_centralBinom` and `Nat.centralBinom_le_four_pow` |
| Prime-power cap (2) | `Nat.pow_factorization_choose_le` |
| Product bound underlying (3) | `Erdos685.choose_le_pow_omega` in `Solution.lean` |
| \(\log n/\log(2n)\to1\) | `Erdos685Research.tendsto_log_div_log_two_mul` in `LogCutoff.lean` |
| General cutoff estimate (4) | `Erdos685.primeFactors_card_le_cutoff` in `PrimeCutoff.lean` |
| \(T_n=n/(\log n)^2\) | `Erdos685Research.cutoff` |
| Eventually \(T_n>1\) | `Erdos685Research.eventually_one_lt_cutoff` |
| Normalized small-prime term tends to zero | `Erdos685Research.tendsto_cutoff_add_one_mul_log_div` |
| \(\log\log n/\log n\to0\) | `Erdos685Research.tendsto_loglog_div_log` |
| \(\log n/\log T_n\to1\) | `Erdos685Research.tendsto_log_div_log_cutoff` |
| Final squeeze (3)–(5) | `Erdos685Research.tendsto_omega_centralBinom` in `CentralAsymptotic.lean` |

The proof's logarithmic cutoff adapts Xylouris's fixed-power cutoff. It avoids
any need to formalize PNT, Stirling's formula, Mertens's theorem, or a
short-interval result for this specialization.
