import canonicalLaneMathlib.AdmissibleClass

/-!
# Lyapunov Function Package

Encodes the Lyapunov function conditions for classical stability analysis.
-/

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovFunctionPackage where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  functionValued : stateSpace → ℝ
  positiveDefinite : Prop
  derivativeNonpositiveAlongFlow : Prop

def LyapunovStability (L : LyapunovFunctionPackage) : Prop :=
  L.positiveDefinite ∧ L.derivativeNonpositiveAlongFlow

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse