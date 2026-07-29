import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.LukasiewiczAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebra (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) where
  chain_of_truth_values : Type u
  order_preserving_operations : Prop
  iterations_of_negation : ℕ → (L.carrier → L.carrier)
  post_axioms : Prop

structure PostAlgebraEvidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) where
  post_axioms_closed : P.post_axioms
  order_preserving_operations_closed : P.order_preserving_operations

def PostAlgebraClosed (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) : Prop :=
  P.post_axioms ∧ P.order_preserving_operations

theorem post_algebra_closed_from_evidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) (E : PostAlgebraEvidence A L M P) :
    PostAlgebraClosed A L M P := by
  exact And.intro E.post_axioms_closed E.order_preserving_operations_closed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse