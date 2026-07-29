import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LyapunovFunction

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure StabilityCriteria (X : Type) where
  equilibriumPoint : X
  lyapunovFunction : LyapunovFunction X
  epsilonDeltaCondition : Prop
  asymptoticStability : Prop
  exponentialStability : Prop
  stabilityRegion : Set X

structure StabilityEvidence (X : Type) (S : StabilityCriteria X) where
  epsilonDeltaConditionClosed : S.epsilonDeltaCondition
  asymptoticStabilityClosed : S.asymptoticStability
  exponentialStabilityClosed : S.exponentialStability
  stabilityRegionClosed : S.stabilityRegion = S.stabilityRegion

def StabilityClosed (X : Type) (S : StabilityCriteria X) : Prop :=
  S.epsilonDeltaCondition ∧
  S.asymptoticStability ∧
  S.exponentialStability ∧
  (S.stabilityRegion = S.stabilityRegion)

theorem stability_closed_from_evidence (X : Type) (S : StabilityCriteria X) (E : StabilityEvidence X S) :
    StabilityClosed X S := by
  exact And.intro E.epsilonDeltaConditionClosed
    (And.intro E.asymptoticStabilityClosed
      (And.intro E.exponentialStabilityClosed E.stabilityRegionClosed))

end HautevilleHouse
end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean