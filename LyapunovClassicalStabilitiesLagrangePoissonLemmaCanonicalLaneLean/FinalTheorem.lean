import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

def ConstrainedLyapunovStabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_lyapunov_stability_endgame (A : AdmissibleClass) :
    ConstrainedLyapunovStabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse