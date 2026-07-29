import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LagrangeStabilityPackage (A : AdmissibleLyapunovClass) where
  forwardTrajectoryBounded : Prop
  omegaLimitSetNonempty : Prop
  closureContainsLimitPoints : Prop

structure LagrangeStabilityEvidence {A : AdmissibleLyapunovClass} (L : LagrangeStabilityPackage A) where
  forwardTrajectoryBoundedClosed : L.forwardTrajectoryBounded
  omegaLimitSetNonemptyClosed : L.omegaLimitSetNonempty
  closureContainsLimitPointsClosed : L.closureContainsLimitPoints

def LagrangeStabilityClosed {A : AdmissibleLyapunovClass} (L : LagrangeStabilityPackage A) : Prop :=
  L.forwardTrajectoryBounded ∧ L.omegaLimitSetNonempty ∧ L.closureContainsLimitPoints

theorem lagrange_stability_closed_from_evidence
    {A : AdmissibleLyapunovClass} (L : LagrangeStabilityPackage A)
    (E : LagrangeStabilityEvidence L) : LagrangeStabilityClosed L := by
  exact And.intro E.forwardTrajectoryBoundedClosed
    (And.intro E.omegaLimitSetNonemptyClosed E.closureContainsLimitPointsClosed)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse