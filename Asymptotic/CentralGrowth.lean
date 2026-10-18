/-
Copyright 2026 AItoBit.
Licensed under the Apache License, Version 2.0. See LICENSE.
-/

import Mathlib.Data.Nat.Choose.Central
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.NormNum

open Filter Real
open scoped Topology

namespace Erdos685Research

/-- The logarithm of the central binomial coefficient has exponential rate `log 4`. -/
theorem tendsto_log_centralBinom_div :
    Tendsto (fun n : ℕ => Real.log (Nat.centralBinom n : ℝ) / (n : ℝ))
      atTop (𝓝 (Real.log 4)) := by
  have hnat : Tendsto (fun n : ℕ => (n : ℝ)) atTop atTop := tendsto_natCast_atTop_atTop
  have hlog : Tendsto (fun n : ℕ => Real.log (n : ℝ) / (n : ℝ)) atTop (𝓝 0) := by
    simpa [Function.comp_def] using (Real.tendsto_pow_log_div_mul_add_atTop 1 0 1 one_ne_zero).comp hnat
  have hlo : Tendsto (fun n : ℕ => Real.log 4 - Real.log (n : ℝ) / (n : ℝ))
      atTop (𝓝 (Real.log 4)) := by
    simpa using tendsto_const_nhds.sub hlog
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlo tendsto_const_nhds
  · filter_upwards [eventually_ge_atTop 4] with n hn
    have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
    have hcb : (0 : ℝ) < Nat.centralBinom n := by exact_mod_cast Nat.centralBinom_pos n
    have h := Real.log_le_log (by positivity : (0 : ℝ) < 4 ^ n)
      (show (4 : ℝ) ^ n ≤ (n : ℝ) * Nat.centralBinom n by
        exact_mod_cast (Nat.four_pow_lt_mul_centralBinom n hn).le)
    rw [Real.log_pow, Real.log_mul hnpos.ne' hcb.ne'] at h
    apply (le_div_iff₀ hnpos).mpr
    have heq : (Real.log 4 - Real.log (n : ℝ) / (n : ℝ)) * (n : ℝ) =
        (n : ℝ) * Real.log 4 - Real.log (n : ℝ) := by
      rw [sub_mul, div_mul_cancel₀ _ hnpos.ne']
      ring
    rw [heq]
    linarith
  · filter_upwards [eventually_ge_atTop 4] with n hn
    have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
    have hcb : (0 : ℝ) < Nat.centralBinom n := by exact_mod_cast Nat.centralBinom_pos n
    have h := Real.log_le_log hcb
      (show (Nat.centralBinom n : ℝ) ≤ (4 : ℝ) ^ n by
        exact_mod_cast Nat.centralBinom_le_four_pow n)
    rw [Real.log_pow] at h
    apply (div_le_iff₀ hnpos).mpr
    nlinarith

end Erdos685Research
