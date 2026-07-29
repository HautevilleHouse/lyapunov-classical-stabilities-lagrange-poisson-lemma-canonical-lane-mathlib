import canonicalLaneMathlib.AdmissibleClass
import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LagrangePoissonLemma

/-!
# Stability Bridge

Bridge between Lyapunov stability and admitted admissible classes.
-/

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.gateWitness.elim (fun h => h) (fun h => h)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse