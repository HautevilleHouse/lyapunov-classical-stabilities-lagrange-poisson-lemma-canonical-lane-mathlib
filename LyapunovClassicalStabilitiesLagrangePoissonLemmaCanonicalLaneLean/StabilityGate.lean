import canonicalLaneMathlib.AdmissibleClass
import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LagrangePoissonLemma

/-!
# Stability Gate

Gate closure for Lyapunov admissible classes.
-/

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness.elim (fun h => h) (fun h => h)

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse