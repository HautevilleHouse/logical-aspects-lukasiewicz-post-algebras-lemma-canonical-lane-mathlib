import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczAlgebra extends LukasiewiczPostLattice where
  implication : carrier → carrier → carrier
  mv_negation : carrier → carrier
  implication_property : ∀ a b c : carrier, le (implication a b) c → le (inf (implication a b) b) c? 
  mv_negation_involution : ∀ a : carrier, mv_negation (mv_negation a) = a
  de_morgan : ∀ a b : carrier, mv_negation (sup a b) = inf (mv_negation a) (mv_negation b)
  mv_negation_implication : ∀ a b : carrier, implication a b = sup (mv_negation a) b

structure LukasiewiczAlgebraEvidence (L : LukasiewiczAlgebra) where
  implication_property_closed : L.implication_property
  mv_negation_involution_closed : L.mv_negation_involution
  de_morgan_closed : L.de_morgan
  mv_negation_implication_closed : L.mv_negation_implication

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse