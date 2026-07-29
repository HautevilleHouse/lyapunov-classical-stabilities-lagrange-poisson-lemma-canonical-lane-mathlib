import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovDirectMethodPackage where
  stateSpace : Type u
  vectorField : stateSpace → stateSpace
  equilibrium : stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  derivativeNonPositive : Prop
  stability : Prop
  positiveDefiniteTerm : positiveDefinite
  derivativeNonPositiveTerm : derivativeNonPositive
  stabilityProof : positiveDefinite → derivativeNonPositive → stability
  stabilityProofTerm : stabilityProof

structure LyapunovDirectMethodEvidence (L : LyapunovDirectMethodPackage) where
  positiveDefiniteClosed : L.positiveDefinite
  derivativeNonPositiveClosed : L.derivativeNonPositive
  stabilityClosed : L.stability

def LyapunovDirectMethodClosed (L : LyapunovDirectMethodPackage) : Prop :=
  L.positiveDefinite ∧ L.derivativeNonPositive ∧ L.stability

theorem lyapunov_direct_method_closed_from_evidence
    (L : LyapunovDirectMethodPackage) (E : LyapunovDirectMethodEvidence L) :
    LyapunovDirectMethodClosed L := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.derivativeNonPositiveClosed E.stabilityClosed)

theorem stabilityDerived (L : LyapunovDirectMethodPackage) (E : LyapunovDirectMethodEvidence L) : L.stability := by
  apply L.stabilityProofTerm E.positiveDefiniteClosed E.derivativeNonPositiveClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse