import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebra (L : LukasiewiczAlgebra) where
  carrier : Type u
  plus : carrier → carrier → carrier
  times : carrier → carrier → carrier
  star : carrier → carrier
  zero : carrier
  one : carrier
  plusAssoc : ∀ a b c : carrier, plus (plus a b) c = plus a (plus b c)
  plusComm : ∀ a b : carrier, plus a b = plus b a
  plusZero : ∀ a : carrier, plus a zero = a
  timesAssoc : ∀ a b c : carrier, times (times a b) c = times a (times b c)
  timesComm : ∀ a b : carrier, times a b = times b a
  timesOne : ∀ a : carrier, times a one = a
  distrib : ∀ a b c : carrier, times a (plus b c) = plus (times a b) (times a c)
  starInvolution : ∀ a : carrier, star (star a) = a
  starDeMorgan : ∀ a b : carrier, star (plus a b) = times (star a) (star b)
  deMorganPlusTimes : ∀ a b : carrier, star (times a b) = plus (star a) (star b)
  postAxiom : ∀ a : carrier, plus (star a) a = one
  lukasiewiczEmbedding : L.carrier → carrier
  lukasiewiczEmbeddingHom : ∀ a b : L.carrier, lukasiewiczEmbedding (L.plus a b) = plus (lukasiewiczEmbedding a) (lukasiewiczEmbedding b)

structure PostAlgebraEvidence (L : LukasiewiczAlgebra) (P : PostAlgebra L) where
  plusAssocClosed : P.plusAssoc
  plusCommClosed : P.plusComm
  plusZeroClosed : P.plusZero
  timesAssocClosed : P.timesAssoc
  timesCommClosed : P.timesComm
  timesOneClosed : P.timesOne
  distribClosed : P.distrib
  starInvolutionClosed : P.starInvolution
  starDeMorganClosed : P.starDeMorgan
  deMorganPlusTimesClosed : P.deMorganPlusTimes
  postAxiomClosed : P.postAxiom
  lukasiewiczEmbeddingHomClosed : P.lukasiewiczEmbeddingHom

def PostAlgebraClosed (L : LukasiewiczAlgebra) (P : PostAlgebra L) : Prop :=
  P.plusAssoc ∧ P.plusComm ∧ P.plusZero ∧ P.timesAssoc ∧ P.timesComm ∧ P.timesOne ∧
  P.distrib ∧ P.starInvolution ∧ P.starDeMorgan ∧ P.deMorganPlusTimes ∧ P.postAxiom ∧
  P.lukasiewiczEmbeddingHom

theorem post_algebra_closed_from_evidence (L : LukasiewiczAlgebra) (P : PostAlgebra L) (E : PostAlgebraEvidence L P) :
    PostAlgebraClosed L P := by
  exact And.intro E.plusAssocClosed
    (And.intro E.plusCommClosed
      (And.intro E.plusZeroClosed
        (And.intro E.timesAssocClosed
          (And.intro E.timesCommClosed
            (And.intro E.timesOneClosed
              (And.intro E.distribClosed
                (And.intro E.starInvolutionClosed
                  (And.intro E.starDeMorganClosed
                    (And.intro E.deMorganPlusTimesClosed
                      (And.intro E.postAxiomClosed E.lukasiewiczEmbeddingHomClosed))))))))))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse