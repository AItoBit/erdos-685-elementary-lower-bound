# Xylouris 0709.4676v1: full-text reading record

Reviewed on 18 October 2026 by the independent source/status agent.
Primary HTML https://arxiv.org/html/0709.4676v1 was read from abstract through
the final bibliography, including every substantive displayed equation.
The HTML corresponds to the 15-page v1 PDF previously consulted.
No source text is reproduced here. This is full-text reading, not certification
of every proof in the paper. Proof-check scope is Theorem 2 and the central
specialization; the full paper has not been formalized.

## Section-level notes

- Abstract and Section 1: distinct-prime convention, natural logarithms,
  valuation and prime-counting notation fixed.
- Section 2: binomial prime counts motivate elementary prime estimates.
- Section 3, Lemma 1: valuation carries become disjoint prime-power intervals.
- Section 3, Theorem 1: primes below the square-root scale account for the
  discrepancy between a prime-counting sum and the distinct-factor count.
- Section 3, Theorem 2: fixed-ratio binomial coefficients have an entropy
  constant; the proof uses factorial growth, the prime-power cap, and a cutoff.
- Section 3, remarks and Theorem 3: sublinear-index comparison and balanced
  factorial-ratio identities connect the discussion with Chebyshev's psi.
- Section 4, Corollary 1 and remarks: alternating combinations produce numerical
  prime-count bounds; the attempted improvement towards PNT faces a Mobius-sum
  obstruction.
- Section 4, Corollary 2: existence of all integer-dilation ratios implies PNT.
- Section 4, Corollary 3: logarithm series emerge; the paper also acknowledges
  elementary treatments.
- Section 5: bibliography read, including the explicit Erdos1979 p77 attribution.

## Independent check of the proof actually used

The fixed source parameters n=2,m=1 give the central coefficient B(k)=C(2k,k)
and constant log(4). Distinct factors, rather than multiplicity count, are
essential. The source's lower estimate follows from bounding every full
prime-power component by 2k. Its upper estimate counts factors above a
threshold and bounds those below it by the number of integers below it.
Our logarithmic-cutoff implementation is an adaptation, as documented in
central-binomial-source-audit.md.

There is a harmless fixed-factor omission in the printed upper-cutoff estimate:
with threshold (nk)^(1-epsilon), the elementary small-factor bound is
(nk)^(1-epsilon), not literally k^(1-epsilon). Since n is fixed, this is
O_n(k^(1-epsilon))=o(k/log(k)); the leading constant and conclusion are
unaffected. A faithful implementation should prove the correct finite bound
rather than copying this display literally.

For a product containing no large prime, a strict product inequality also needs
care at exceptional tiny inputs; a non-strict logarithmic inequality suffices.
The proposed formal proof uses that safe version. No claim depends on the
unqualified near-linear-index remark outside the fixed-ratio specialization.

The HTML rendering of Theorem 3's equation (12) drops a psi token in one term.
This formula is not imported into the central-binomial proof. Its presentation
should be checked against the PDF before any later formalization of Theorem 3.

## Provenance and counts

This is an established Erdos result with an explicit proof in Xylouris, not
a newly proved mathematical asymptotic. Bibliographic source:
P. Erdos, Some unconventional problems in number theory, Acta Math. Acad. Sci.
Hungar. 33 (1979), 71--80, p77; DOI https://doi.org/10.1007/BF01903382.

This pass upgrades exactly one distinct arXiv work from partial to full-text
reviewed: arXiv:0709.4676v1. It adds no second work for the PDF/HTML duplication,
no new original theorem, and no claim of reading the cited bibliography's papers.
The 100-paper campaign remains incomplete. The original papers.jsonl is untouched;
the new record is in round2-papers.jsonl.
