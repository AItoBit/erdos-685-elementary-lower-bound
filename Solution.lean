/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module

public import Mathlib.Data.Nat.Choose.Factorization
public import Mathlib.NumberTheory.ArithmeticFunction.Misc
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
# Elementary lower bound accompanying Erdos problem 685

This proves the existing non-strict textbook bound, not the open uniform
asymptotic conjectures. Source: Erdos, Some unconventional problems in
number theory (1979), printed page 77, equation (9), with equality cases
handled by the non-strict inequality.
-/

@[expose] public section

open Real Finset
open scoped ArithmeticFunction.omega

namespace Erdos685

/-- Every prime-power block of a binomial coefficient is at most its upper index. -/
theorem choose_le_pow_omega {n k : ℕ} (hn : 0 < n) (hk : k ≤ n) :
    n.choose k ≤ n ^ (ω (n.choose k)) := by
  have hc : (n.choose k).primeFactors.card = ω (n.choose k) := by
    simp only [Nat.primeFactors, List.card_toFinset, ArithmeticFunction.cardDistinctFactors_apply]
  calc
    n.choose k = ∏ p ∈ (n.choose k).primeFactors,
        p ^ (n.choose k).factorization p := Nat.prod_primeFactors_pow_factorization (Nat.choose_ne_zero hk)
    _ ≤ ∏ _p ∈ (n.choose k).primeFactors, n :=
      Finset.prod_le_prod fun _ _ => Nat.pow_factorization_choose_le hn
    _ = n ^ (ω (n.choose k)) := by simp [hc]

/-- The elementary logarithmic lower bound recorded with Erdős problem 685. -/
theorem trivial_lower_bound (n k : ℕ) (hk0 : 0 < k) (hkn : k < n) :
    log (n.choose k : ℝ) / log (n : ℝ) ≤ (ω (n.choose k) : ℝ) := by
  have hn : 1 < n := by omega
  have hp : 0 < log (n : ℝ) := Real.log_pos (by exact_mod_cast hn)
  apply (div_le_iff₀ hp).mpr
  have hpow : (n.choose k : ℝ) ≤ (n : ℝ) ^ (ω (n.choose k)) := by
    exact_mod_cast choose_le_pow_omega (by omega) hkn.le
  have hlog := Real.log_le_log (Nat.cast_pos.mpr (Nat.choose_pos hkn.le)) hpow
  simpa only [Real.log_pow] using hlog

end Erdos685
