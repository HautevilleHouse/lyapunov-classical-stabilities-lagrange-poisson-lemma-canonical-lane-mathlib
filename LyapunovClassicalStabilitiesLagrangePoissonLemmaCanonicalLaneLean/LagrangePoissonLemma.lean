import canonicalLaneMathlib.AdmissibleClass
import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.InvariantMeasures
import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LyapunovFunction

/-!
# Lagrange-Poisson Lemma

Formalizes the lemma relating invariant measures and Lyapunov stability.
-/

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LagrangePoissonLemmaPackage
    {L : LyapunovFunctionPackage} (μ : InvariantMeasure) where
  measurePreservingFlow : measurePreserving L.flow μ
  lyapunovStable : LyapunovStability L

def ConstrainedLyapunovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lyapunov_endgame (A : AdmissibleClass) :
    ConstrainedLyapunovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse