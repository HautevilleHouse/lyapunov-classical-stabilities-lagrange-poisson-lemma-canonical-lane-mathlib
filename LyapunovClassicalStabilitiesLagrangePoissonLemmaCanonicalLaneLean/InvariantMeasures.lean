import canonicalLaneMathlib.AdmissibleClass

/-!
# Invariant Measures for Lagrange-Poisson Lemma

This module encodes the invariant-measure decomposition needed for the
Lagrange-Poisson lemma in stability analysis. The lemma governs the stability
of equilibrium points for Hamiltonian systems under Lyapunov methods.
-/

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure InvariantMeasure where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : Set carrier → ℝ
  sigmaFinite : Prop
  invarianceUnderFlow : Prop

def measurePreserving (F : MeasureDynamicsPackage) (μ : InvariantMeasure) : Prop :=
  ∀ s, μ.measure s = μ.measure (F.preimage s)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse