import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LyapunovFunctionPackage

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LagrangePoissonStabilityPackage where
  system : Type u
  stateSpace : Type v
  dynamics : stateSpace → stateSpace
  lagrangeStableOrbit : Prop
  poissonStableTrajectory : Prop
  recurrenceProperty : Prop
  invariantMeasure : Prop

structure LagrangePoissonStabilityEvidence (S : LagrangePoissonStabilityPackage) where
  lagrangeStableOrbitClosed : S.lagrangeStableOrbit
  poissonStableTrajectoryClosed : S.poissonStableTrajectory
  recurrencePropertyClosed : S.recurrenceProperty
  invariantMeasureClosed : S.invariantMeasure

def LagrangePoissonStabilityClosed (S : LagrangePoissonStabilityPackage) : Prop :=
  S.lagrangeStableOrbit ∧ S.poissonStableTrajectory ∧
  S.recurrenceProperty ∧ S.invariantMeasure

theorem lagrange_poisson_stability_closed_from_evidence
    (S : LagrangePoissonStabilityPackage)
    (E : LagrangePoissonStabilityEvidence S) : LagrangePoissonStabilityClosed S := by
  exact And.intro E.lagrangeStableOrbitClosed
    (And.intro E.poissonStableTrajectoryClosed
      (And.intro E.recurrencePropertyClosed E.invariantMeasureClosed))

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse