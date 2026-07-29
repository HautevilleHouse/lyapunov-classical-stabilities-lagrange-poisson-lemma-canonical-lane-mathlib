import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure InvariantMeasurePackage (A : AdmissibleLyapunovClass) where
  measure : Type u
  invariantUnderDynamics : Prop
  positiveOnOpenSets : Prop
  poissonRecurrence : Prop

structure InvariantMeasureEvidence {A : AdmissibleLyapunovClass} (M : InvariantMeasurePackage A) where
  invariantClosed : M.invariantUnderDynamics
  positiveClosed : M.positiveOnOpenSets
  poissonRecurrenceClosed : M.poissonRecurrence

def InvariantMeasureClosed {A : AdmissibleLyapunovClass} (M : InvariantMeasurePackage A) : Prop :=
  M.invariantUnderDynamics ∧ M.positiveOnOpenSets ∧ M.poissonRecurrence

theorem invariant_measure_closed_from_evidence
    {A : AdmissibleLyapunovClass} (M : InvariantMeasurePackage A)
    (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro E.invariantClosed (And.intro E.positiveClosed E.poissonRecurrenceClosed)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse