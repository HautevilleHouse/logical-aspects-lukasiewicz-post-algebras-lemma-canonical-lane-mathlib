import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebra (n : ℕ) where
  carrier : Type u
  chain : Fin n → carrier
  latticeOps : carrier → carrier → carrier
  constantsDefined : Prop

def PostAlgebraEvidence (n : ℕ) (P : PostAlgebra n) : Prop :=
  P.constantsDefined

def PostAlgebraClosed (n : ℕ) (P : PostAlgebra n) : Prop :=
  P.constantsDefined

theorem post_algebra_closed_from_evidence (n : ℕ) (P : PostAlgebra n) (h : PostAlgebraEvidence n P) :
  PostAlgebraClosed n P := h

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse