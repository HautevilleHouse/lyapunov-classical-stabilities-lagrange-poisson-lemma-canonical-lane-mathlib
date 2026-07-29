import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovStableObject where
  stateSpace : Type u
  dynamics : stateSpace → stateSpace
  equilibrium : stateSpace
  equilibriumFixed : dynamics equilibrium = equilibrium

structure AdmissibleLyapunovClass where
  object : LyapunovStableObject
  lagrangeStability : Prop
  poissonStability : Prop
  lyapunovFunction : Type v
  lyapunovFunctionPositive : Prop
  lyapunovDerivativeNonpositive : Prop
  closureCondition : lagrangeStability ∨ poissonStability

def LyapunovWitnessClosed (O : LyapunovStableObject) : Prop :=
  O.equilibriumFixed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse