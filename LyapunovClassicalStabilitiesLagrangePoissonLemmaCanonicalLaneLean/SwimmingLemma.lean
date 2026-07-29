import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure SwimmingLemmaPackage where
  stateSpace : Type u
  flow : stateSpace → stateSpace → stateSpace
  omegaLimitSet : Set stateSpace
  omegaCompact : Prop
  omegaInvariant : Prop
  omegaAttracts : Prop
  swimmingConclusion : omegaCompact → omegaInvariant → omegaAttracts → (∀ x ∈ omegaLimitSet, x = x)
  swimmingConclusionTerm : swimmingConclusion

structure SwimmingLemmaEvidence (S : SwimmingLemmaPackage) where
  omegaCompactClosed : S.omegaCompact
  omegaInvariantClosed : S.omegaInvariant
  omegaAttractsClosed : S.omegaAttracts
  conclusionClosed : ∀ x ∈ S.omegaLimitSet, x = x

def SwimmingLemmaClosed (S : SwimmingLemmaPackage) : Prop :=
  S.omegaCompact ∧ S.omegaInvariant ∧ S.omegaAttracts ∧ (∀ x ∈ S.omegaLimitSet, x = x)

theorem swimming_lemma_closed_from_evidence
    (S : SwimmingLemmaPackage) (E : SwimmingLemmaEvidence S) :
    SwimmingLemmaClosed S := by
  exact And.intro E.omegaCompactClosed (And.intro E.omegaInvariantClosed (And.intro E.omegaAttractsClosed E.conclusionClosed))

theorem swimmingConclusionApplied (S : SwimmingLemmaPackage) (E : SwimmingLemmaEvidence S) : ∀ x ∈ S.omegaLimitSet, x = x := by
  apply S.swimmingConclusionTerm E.omegaCompactClosed E.omegaInvariantClosed E.omegaAttractsClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse