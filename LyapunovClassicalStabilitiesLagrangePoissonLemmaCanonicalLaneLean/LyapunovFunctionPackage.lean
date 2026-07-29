import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovFunctionPackage where
  system : Type u
  stateSpace : Type v
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  derivativeNonPositive : Prop
  derivativeAlongFlow : stateSpace → ℝ
  lyapunovStability : Prop
  asymptoticStability : Prop
  laSalleInvariance : Prop

structure LyapunovFunctionEvidence (L : LyapunovFunctionPackage) where
  positiveDefiniteClosed : L.positiveDefinite
  derivativeNonPositiveClosed : L.derivativeNonPositive
  lyapunovStabilityClosed : L.lyapunovStability
  asymptoticStabilityClosed : L.asymptoticStability
  laSalleInvarianceClosed : L.laSalleInvariance

def LyapunovFunctionClosed (L : LyapunovFunctionPackage) : Prop :=
  L.positiveDefinite ∧ L.derivativeNonPositive ∧
  L.lyapunovStability ∧ L.asymptoticStability ∧ L.laSalleInvariance

theorem lyapunov_function_closed_from_evidence (L : LyapunovFunctionPackage)
    (E : LyapunovFunctionEvidence L) : LyapunovFunctionClosed L := by
  exact And.intro E.positiveDefiniteClosed
    (And.intro E.derivativeNonPositiveClosed
      (And.intro E.lyapunovStabilityClosed
        (And.intro E.asymptoticStabilityClosed E.laSalleInvarianceClosed)))

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse