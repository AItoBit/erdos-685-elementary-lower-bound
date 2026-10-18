/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module

public import Mathlib.Data.Nat.Choose.Factorization
public import Mathlib.NumberTheory.ArithmeticFunction.Misc
public import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# An elementary bound associated with Erdos problem 685

This is the known finite logarithmic lower bound. The uniform pointwise
asymptotics in the main problem are not asserted or proved here.
-/

@[expose] public section
set_option warn.sorry false
open Real
open scoped ArithmeticFunction.omega
namespace Erdos685

/-- The number of distinct prime divisors bounds the binomial logarithm. -/
theorem trivial_lower_bound (n k : ℕ) (hk0 : 0 < k) (hkn : k < n) :
    log (n.choose k : ℝ) / log (n : ℝ) ≤ (ω (n.choose k) : ℝ) := by
  sorry

end Erdos685
