import LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.LagrangePoissonStability

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure HamiltonianDynamicsPackage where
  phaseSpace : Type u
  hamiltonian : phaseSpace → ℝ
  symplecticForm : Type v
  gradientVectorField : phaseSpace → phaseSpace
  integralInvariant : Prop
  stabilityViaLyapunovFunction : Prop

structure HamiltonianDynamicsEvidence (H : HamiltonianDynamicsPackage) where
  integralInvariantClosed : H.integralInvariant
  stabilityViaLyapunovFunctionClosed : H.stabilityViaLyapunovFunction

def HamiltonianDynamicsClosed (H : HamiltonianDynamicsPackage) : Prop :=
  H.integralInvariant ∧ H.stabilityViaLyapunovFunction

theorem hamiltonian_dynamics_closed_from_evidence
    (H : HamiltonianDynamicsPackage) (E : HamiltonianDynamicsEvidence H) :
    HamiltonianDynamicsClosed H := by
  exact And.intro E.integralInvariantClosed E.stabilityViaLyapunovFunctionClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse