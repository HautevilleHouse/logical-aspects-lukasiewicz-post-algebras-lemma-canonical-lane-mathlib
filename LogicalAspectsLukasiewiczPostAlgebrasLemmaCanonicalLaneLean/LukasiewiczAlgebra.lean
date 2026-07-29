import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczAlgebra (A : AdmissibleClass) (L : LukasiewiczLattice A) where
  implication : L.carrier → L.carrier → L.carrier
  negation : L.carrier → L.carrier
  mv_algebra_axioms : Prop
  implication_negation_consistent : Prop

structure LukasiewiczAlgebraEvidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) where
  mv_algebra_axioms_closed : M.mv_algebra_axioms
  implication_negation_consistent_closed : M.implication_negation_consistent

def LukasiewiczAlgebraClosed (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) : Prop :=
  M.mv_algebra_axioms ∧ M.implication_negation_consistent

theorem lukasiewicz_algebra_closed_from_evidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (E : LukasiewiczAlgebraEvidence A L M) :
    LukasiewiczAlgebraClosed A L M := by
  exact And.intro E.mv_algebra_axioms_closed E.implication_negation_consistent_closed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse