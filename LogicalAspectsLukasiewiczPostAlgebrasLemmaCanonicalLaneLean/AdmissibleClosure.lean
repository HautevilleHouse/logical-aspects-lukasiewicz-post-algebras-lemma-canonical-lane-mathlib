import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LukasiewiczPostAlgebrasAdmittedObject where
  algebra : LukasiewiczAlgebra
  postAlgebra : PostAlgebra algebra
  latticeRep : LatticeRepresentation algebra
  completeness : CompletenessLemma algebra postAlgebra
  stoneRep : StoneRepresentation algebra latticeRep
  allClosed : LukasiewiczAlgebraClosed algebra ∧ PostAlgebraClosed algebra postAlgebra ∧
    LatticeRepresentationClosed algebra latticeRep ∧ CompletenessLemmaClosed algebra postAlgebra completeness ∧
    StoneRepresentationClosed algebra latticeRep stoneRep

structure LukasiewiczPostAlgebrasEndgameState where
  object : LukasiewiczPostAlgebrasAdmittedObject

def LukasiewiczPostAlgebrasWitnessClosed (O : LukasiewiczPostAlgebrasAdmittedObject) : Prop :=
  O.allClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse