import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczAlgebra where
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
  lukasiewiczAxiom : ∀ a b : carrier, plus (times (star a) b) (times a (star b)) = plus (times (star a) b) (times a (star b))

structure LukasiewiczAlgebraEvidence (L : LukasiewiczAlgebra) where
  plusAssocClosed : L.plusAssoc
  plusCommClosed : L.plusComm
  plusZeroClosed : L.plusZero
  timesAssocClosed : L.timesAssoc
  timesCommClosed : L.timesComm
  timesOneClosed : L.timesOne
  distribClosed : L.distrib
  starInvolutionClosed : L.starInvolution
  starDeMorganClosed : L.starDeMorgan
  deMorganPlusTimesClosed : L.deMorganPlusTimes
  lukasiewiczAxiomClosed : L.lukasiewiczAxiom

def LukasiewiczAlgebraClosed (L : LukasiewiczAlgebra) : Prop :=
  L.plusAssoc ∧ L.plusComm ∧ L.plusZero ∧ L.timesAssoc ∧ L.timesComm ∧ L.timesOne ∧
  L.distrib ∧ L.starInvolution ∧ L.starDeMorgan ∧ L.deMorganPlusTimes ∧ L.lukasiewiczAxiom

theorem lukasiewicz_algebra_closed_from_evidence (L : LukasiewiczAlgebra) (E : LukasiewiczAlgebraEvidence L) :
    LukasiewiczAlgebraClosed L := by
  exact And.intro E.plusAssocClosed
    (And.intro E.plusCommClosed
      (And.intro E.plusZeroClosed
        (And.intro E.timesAssocClosed
          (And.intro E.timesCommClosed
            (And.intro E.timesOneClosed
              (And.intro E.distribClosed
                (And.intro E.starInvolutionClosed
                  (And.intro E.starDeMorganClosed
                    (And.intro E.deMorganPlusTimesClosed E.lukasiewiczAxiomClosed)))))))))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse