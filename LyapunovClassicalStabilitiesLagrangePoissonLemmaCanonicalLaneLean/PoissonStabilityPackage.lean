import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure PoissonStabilityPackage (A : AdmissibleLyapunovClass) where
  recurrenceProperty : Prop
  omegaLimitSetInvariant : Prop
  poissonStablePointsDense : Prop

structure PoissonStabilityEvidence {A : AdmissibleLyapunovClass} (P : PoissonStabilityPackage A) where
  recurrencePropertyClosed : P.recurrenceProperty
  omegaLimitSetInvariantClosed : P.omegaLimitSetInvariant
  poissonStablePointsDenseClosed : P.poissonStablePointsDense

def PoissonStabilityClosed {A : AdmissibleLyapunovClass} (P : PoissonStabilityPackage A) : Prop :=
  P.recurrenceProperty ∧ P.omegaLimitSetInvariant ∧ P.poissonStablePointsDense

theorem poisson_stability_closed_from_evidence
    {A : AdmissibleLyapunovClass} (P : PoissonStabilityPackage A)
    (E : PoissonStabilityEvidence P) : PoissonStabilityClosed P := by
  exact And.intro E.recurrencePropertyClosed
    (And.intro E.omegaLimitSetInvariantClosed E.poissonStablePointsDenseClosed)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse