import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.PostAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure MainLemmaPackage (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) where
  main_statement : Prop
  proof_steps : ℕ
  lemma_dependency : Prop

structure MainLemmaEvidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) (X : MainLemmaPackage A L M P) where
  main_statement_closed : X.main_statement
  lemma_dependency_closed : X.lemma_dependency

def MainLemmaClosed (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) (X : MainLemmaPackage A L M P) : Prop :=
  X.main_statement ∧ X.lemma_dependency

theorem main_lemma_closed_from_evidence (A : AdmissibleClass) (L : LukasiewiczLattice A)
    (M : LukasiewiczAlgebra A L) (P : PostAlgebra A L M) (X : MainLemmaPackage A L M P)
    (E : MainLemmaEvidence A L M P X) : MainLemmaClosed A L M P X := by
  exact And.intro E.main_statement_closed E.lemma_dependency_closed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse