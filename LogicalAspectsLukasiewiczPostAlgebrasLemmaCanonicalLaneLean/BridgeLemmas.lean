import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  (∀ (L : LukasiewiczAlgebra), LukasiewiczClosed L) ∧
  (∀ (n : ℕ) (P : PostAlgebra n), PostAlgebraClosed n P)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  refine ⟨?_, ?_⟩
  · intro L; exact L.axioms
  · intro n P; exact P.constantsDefined

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse