import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean.PhaseSpace

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure LagrangeStability (X : Type) where
  phaseSpace : PhaseSpace X
  orbitClosureCompact : Prop
  positiveLimitSetNonempty : Prop
  invariantLimitSet : Prop
  recurrenceCondition : Prop

structure LagrangeEvidence (X : Type) (L : LagrangeStability X) where
  orbitClosureCompactClosed : L.orbitClosureCompact
  positiveLimitSetNonemptyClosed : L.positiveLimitSetNonempty
  invariantLimitSetClosed : L.invariantLimitSet
  recurrenceConditionClosed : L.recurrenceCondition

def LagrangeClosed (X : Type) (L : LagrangeStability X) : Prop :=
  L.orbitClosureCompact ∧
  L.positiveLimitSetNonempty ∧
  L.invariantLimitSet ∧
  L.recurrenceCondition

theorem lagrange_closed_from_evidence (X : Type) (L : LagrangeStability X) (E : LagrangeEvidence X L) :
    LagrangeClosed X L := by
  exact And.intro E.orbitClosureCompactClosed
    (And.intro E.positiveLimitSetNonemptyClosed
      (And.intro E.invariantLimitSetClosed E.recurrenceConditionClosed))

end HautevilleHouse
end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean