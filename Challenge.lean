/-
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module

public import Mathlib.Data.Nat.Choose.Central
public import Mathlib.NumberTheory.ArithmeticFunction.Misc
public import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# Distinct prime divisors of central binomial coefficients

Classical central specialization of Xylouris, arXiv:0709.4676v1,
Theorem 2, attributed there to Erdos (1979). This does not assert the
uniform sublinear conjecture in Erdos problem 685.
-/

@[expose] public section
set_option warn.sorry false
open Filter
open scoped Topology ArithmeticFunction.omega
namespace Erdos685Research

/-- The number of distinct prime divisors of the central binomial coefficient
is asymptotic to `log 4 * n / log n`. -/
theorem tendsto_omega_centralBinom :
    Tendsto (fun n : ℕ => (ω (Nat.centralBinom n) : ℝ) * Real.log n / (n : ℝ))
      atTop (𝓝 (Real.log 4)) := by
  sorry

end Erdos685Research
