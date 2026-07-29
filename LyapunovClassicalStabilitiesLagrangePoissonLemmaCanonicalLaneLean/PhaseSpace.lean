import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean

structure PhaseSpace (X : Type) where
  state : X
  flowRule : X → X
  invariantMeasure : Prop
  regionOfAttraction : Set X
  regionOfAttractionClosed : regionOfAttraction = regionOfAttraction

structure PhaseSpaceEvidence (X : Type) (P : PhaseSpace X) where
  invariantMeasureClosed : P.invariantMeasure

end HautevilleHouse
end LyapunovClassicalStabilitiesLagrangePoissonLemmaCanonicalLaneLean