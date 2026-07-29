import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.PhaseSpace

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure PoissonStability (X : Type) where
  phaseSpace : PhaseSpace X
  recurrentPoints : Set X
  poissonStable : Prop
  centralMotion : Prop
  minimalSet : Prop

structure PoissonEvidence (X : Type) (P : PoissonStability X) where
  poissonStableClosed : P.poissonStable
  centralMotionClosed : P.centralMotion
  minimalSetClosed : P.minimalSet

def PoissonClosed (X : Type) (P : PoissonStability X) : Prop :=
  P.poissonStable ∧
  P.centralMotion ∧
  P.minimalSet

theorem poisson_closed_from_evidence (X : Type) (P : PoissonStability X) (E : PoissonEvidence X P) :
    PoissonClosed X P := by
  exact And.intro E.poissonStableClosed
    (And.intro E.centralMotionClosed E.minimalSetClosed)

end HautevilleHouse
end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean