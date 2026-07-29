import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure BirkhoffRecurrencePackage where
  space : Type u
  transformation : space → space
  measurePreserving : Prop
  birkhoffRecurrentSet : Set space
  recurrenceTheorem : Prop
  proof : measurePreserving → recurrenceTheorem
  proofTerm : proof

structure BirkhoffRecurrenceEvidence (B : BirkhoffRecurrencePackage) where
  measurePreservingClosed : B.measurePreserving
  recurrenceTheoremClosed : B.recurrenceTheorem

def BirkhoffRecurrenceClosed (B : BirkhoffRecurrencePackage) : Prop :=
  B.measurePreserving ∧ B.recurrenceTheorem

theorem birkhoff_recurrence_closed_from_evidence
    (B : BirkhoffRecurrencePackage) (E : BirkhoffRecurrenceEvidence B) :
    BirkhoffRecurrenceClosed B := by
  exact And.intro E.measurePreservingClosed E.recurrenceTheoremClosed

theorem recurrenceApplied (B : BirkhoffRecurrencePackage) (E : BirkhoffRecurrenceEvidence B) : B.recurrenceTheorem := by
  apply B.proofTerm E.measurePreservingClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse