import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczPostSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LukasiewiczPostAdmittedObject where
  space : LukasiewiczPostSpace
  finiteAxiomatizable : Prop
  complete : Prop
  semanticallyCharacterized : Prop
  conclusion : semanticallyCharacterized

structure LukasiewiczPostEndgameState where
  object : LukasiewiczPostAdmittedObject

def LukasiewiczPostWitnessClosed (O : LukasiewiczPostAdmittedObject) : Prop :=
  O.semanticallyCharacterized

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse