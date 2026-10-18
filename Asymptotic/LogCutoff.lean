/-
Copyright 2026 AItoBit.
Licensed under the Apache License, Version 2.0. See LICENSE.
-/
module


public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Tactic

@[expose] public section

open Filter Real
open scoped Topology

namespace Erdos685Research

noncomputable def cutoff (n : ℕ) : ℝ := (n : ℝ) / Real.log n ^ 2

theorem tendsto_log_nat_div_nat :
    Tendsto (fun n : ℕ => Real.log n / (n : ℝ)) atTop (𝓝 0) := by
  simpa [Function.comp_def] using (Real.tendsto_pow_log_div_mul_add_atTop 1 0 1 one_ne_zero).comp
    tendsto_natCast_atTop_atTop

theorem tendsto_log_nat : Tendsto (fun n : ℕ => Real.log n) atTop atTop :=
  Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop

theorem tendsto_loglog_div_log :
    Tendsto (fun n : ℕ => Real.log (Real.log n) / Real.log n) atTop (𝓝 0) := by
  simpa [Function.comp_def] using (Real.tendsto_pow_log_div_mul_add_atTop 1 0 1 one_ne_zero).comp
    tendsto_log_nat

theorem eventually_one_lt_cutoff : ∀ᶠ n : ℕ in atTop, 1 < cutoff n := by
  have h : Tendsto (fun n : ℕ => Real.log n ^ 2 / (n : ℝ)) atTop (𝓝 0) := by
    simpa [Function.comp_def] using (Real.tendsto_pow_log_div_mul_add_atTop 1 0 2 one_ne_zero).comp
      tendsto_natCast_atTop_atTop
  filter_upwards [h.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1)),
    eventually_gt_atTop 1] with n hn hn1
  have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  have hlpos : 0 < Real.log (n : ℝ) := Real.log_pos (by exact_mod_cast hn1)
  dsimp [cutoff]
  rw [one_lt_div (sq_pos_of_pos hlpos)]
  exact (div_lt_one hnpos).mp hn

theorem tendsto_cutoff_add_one_mul_log_div :
    Tendsto (fun n : ℕ => (cutoff n + 1) * Real.log n / (n : ℝ))
      atTop (𝓝 0) := by
  have h := (tendsto_log_nat.inv_tendsto_atTop).add tendsto_log_nat_div_nat
  simp only [zero_add] at h
  apply h.congr'
  filter_upwards [eventually_gt_atTop 1] with n hn
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (show n ≠ 0 by omega)
  have hl0 : Real.log (n : ℝ) ≠ 0 := (Real.log_pos (by exact_mod_cast hn)).ne'
  dsimp [cutoff]
  field_simp [hn0, hl0]

theorem tendsto_log_div_log_cutoff :
    Tendsto (fun n : ℕ => Real.log n / Real.log (cutoff n)) atTop (𝓝 1) := by
  have hbase : Tendsto (fun n : ℕ => 1 - 2 *
      (Real.log (Real.log n) / Real.log n)) atTop (𝓝 (1 : ℝ)) := by
    simpa using tendsto_const_nhds.sub (tendsto_const_nhds.mul tendsto_loglog_div_log)
  have h := hbase.inv₀ (by norm_num)
  simp only [inv_one] at h
  apply h.congr'
  filter_upwards [eventually_gt_atTop 1] with n hn
  have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  have hlpos : 0 < Real.log (n : ℝ) := Real.log_pos (by exact_mod_cast hn)
  rw [cutoff, Real.log_div hnpos.ne' (pow_ne_zero 2 hlpos.ne'), Real.log_pow]
  have heq : 1 - 2 * (Real.log (Real.log n) / Real.log n) =
      (Real.log n - 2 * Real.log (Real.log n)) / Real.log n := by
    field_simp [hlpos.ne']
  rw [heq, inv_div]
  norm_num

theorem tendsto_log_div_log_two_mul :
    Tendsto (fun n : ℕ => Real.log n / Real.log (2 * (n : ℝ))) atTop (𝓝 1) := by
  have hsmall : Tendsto (fun n : ℕ => Real.log 2 / Real.log n) atTop (𝓝 0) :=
    tendsto_const_nhds.div_atTop tendsto_log_nat
  have hbase : Tendsto (fun n : ℕ => Real.log 2 / Real.log n + 1)
      atTop (𝓝 (1 : ℝ)) := by simpa using hsmall.add tendsto_const_nhds
  have h := hbase.inv₀ (by norm_num)
  simp only [inv_one] at h
  apply h.congr'
  filter_upwards [eventually_gt_atTop 1] with n hn
  have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  have hlpos : 0 < Real.log (n : ℝ) := Real.log_pos (by exact_mod_cast hn)
  rw [Real.log_mul (by norm_num : (2 : ℝ) ≠ 0) hnpos.ne']
  have heq : Real.log 2 / Real.log n + 1 =
      (Real.log 2 + Real.log n) / Real.log n := by
    field_simp [hlpos.ne']
  rw [heq, inv_div]

end Erdos685Research
