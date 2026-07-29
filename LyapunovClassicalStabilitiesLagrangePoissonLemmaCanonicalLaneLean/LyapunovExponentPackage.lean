import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LyapunovExponentPackage where
  timeDomain : Type u
  stateSpace : Type v
  vectorField : stateSpace → stateSpace
  flow : timeDomain → stateSpace → stateSpace
  compactInvariantSet : Set stateSpace
  lyapunovExponentDefined : Prop
  lyapunovExponentFinite : Prop

structure LyapunovExponentEvidence (L : LyapunovExponentPackage) where
  lyapunovExponentDefinedClosed : L.lyapunovExponentDefined
  lyapunovExponentFiniteClosed : L.lyapunovExponentFinite

def LyapunovExponentClosed (L : LyapunovExponentPackage) : Prop :=
  L.lyapunovExponentDefined ∧ L.lyapunovExponentFinite

theorem lyapunov_exponent_closed_from_evidence (L : LyapunovExponentPackage)
    (E : LyapunovExponentEvidence L) : LyapunovExponentClosed L := by
  exact And.intro E.lyapunovExponentDefinedClosed E.lyapunovExponentFiniteClosed

end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean
end HautevilleHouse