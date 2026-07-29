import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovAdmittedObject where
  system : Type u
  stateSpace : Type v
  dynamics : system → stateSpace → stateSpace
  equilibrium : stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  derivativeNonPositive : Prop
  conclusion : positiveDefinite ∧ derivativeNonPositive

structure AdmissibleClass where
  object : LyapunovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse