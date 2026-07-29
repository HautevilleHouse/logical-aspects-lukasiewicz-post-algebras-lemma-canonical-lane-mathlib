import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure EmbeddingBetweenAlgebras (A B : Type u) where
  mapping : A → B
  preservesImpl : Prop
  preservesNeg : Prop
  preservesConstants : Prop

def EmbeddingClosed (A B : Type u) (E : EmbeddingBetweenAlgebras A B) : Prop :=
  E.preservesImpl ∧ E.preservesNeg ∧ E.preservesConstants

structure EmbeddingEvidence (A B : Type u) (E : EmbeddingBetweenAlgebras A B) where
  preservesImplClosed : E.preservesImpl
  preservesNegClosed : E.preservesNeg
  preservesConstantsClosed : E.preservesConstants

theorem embedding_closed_from_evidence (A B : Type u) (E : EmbeddingBetweenAlgebras A B)
  (Ev : EmbeddingEvidence A B E) : EmbeddingClosed A B E := by
  exact And.intro Ev.preservesImplClosed (And.intro Ev.preservesNegClosed Ev.preservesConstantsClosed)

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse