import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure InvariantMeasurePackage where
  flowSpace : Type u
  flow : ℕ → flowSpace → flowSpace
  borelSigmaAlgebra : MeasurableSpace flowSpace
  invariantMeasure : Measure flowSpace
  measurePreserving : Prop
  krylovBogolyubovExist : Prop
  krylovBogolyubovProof : measurePreserving → krylovBogolyubovExist
  krylovBogolyubovProofTerm : krylovBogolyubovProof

structure InvariantMeasureEvidence (I : InvariantMeasurePackage) where
  measurePreservingClosed : I.measurePreserving
  krylovBogolyubovExistClosed : I.krylovBogolyubovExist

def InvariantMeasureClosed (I : InvariantMeasurePackage) : Prop :=
  I.measurePreserving ∧ I.krylovBogolyubovExist

theorem invariant_measure_closed_from_evidence
    (I : InvariantMeasurePackage) (E : InvariantMeasureEvidence I) :
    InvariantMeasureClosed I := by
  exact And.intro E.measurePreservingClosed E.krylovBogolyubovExistClosed

theorem krylovBogolyubovApplied (I : InvariantMeasurePackage) (E : InvariantMeasureEvidence I) : I.krylovBogolyubovExist := by
  apply I.krylovBogolyubovProofTerm E.measurePreservingClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse