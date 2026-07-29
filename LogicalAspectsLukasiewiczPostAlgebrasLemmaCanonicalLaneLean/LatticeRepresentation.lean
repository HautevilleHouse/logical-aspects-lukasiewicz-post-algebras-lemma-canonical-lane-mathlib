import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LatticeRepresentation (L : LukasiewiczAlgebra) where
  representation : Type u
  order : representation → representation → Prop
  join : representation → representation → representation
  meet : representation → representation → representation
  top : representation
  bottom : representation
  orderReflexive : ∀ x : representation, order x x
  orderTransitive : ∀ x y z : representation, order x y → order y z → order x z
  orderAntisymmetric : ∀ x y : representation, order x y → order y x → x = y
  joinDef : ∀ x y : representation, order x (join x y) ∧ order y (join x y) ∧ ∀ z : representation, order x z → order y z → order (join x y) z
  meetDef : ∀ x y : representation, order (meet x y) x ∧ order (meet x y) y ∧ ∀ z : representation, order z x → order z y → order z (meet x y)
  topBound : ∀ x : representation, order x top
  bottomBound : ∀ x : representation, order bottom x
  embed : L.carrier → representation
  embedOrder : ∀ a b : L.carrier, embed (L.plus a b) = join (embed a) (embed b)
  embedMeet : ∀ a b : L.carrier, embed (L.times a b) = meet (embed a) (embed b)

structure LatticeRepresentationEvidence (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) where
  orderReflexiveClosed : R.orderReflexive
  orderTransitiveClosed : R.orderTransitive
  orderAntisymmetricClosed : R.orderAntisymmetric
  joinDefClosed : R.joinDef
  meetDefClosed : R.meetDef
  topBoundClosed : R.topBound
  bottomBoundClosed : R.bottomBound
  embedOrderClosed : R.embedOrder
  embedMeetClosed : R.embedMeet

def LatticeRepresentationClosed (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) : Prop :=
  R.orderReflexive ∧ R.orderTransitive ∧ R.orderAntisymmetric ∧ R.joinDef ∧ R.meetDef ∧
  R.topBound ∧ R.bottomBound ∧ R.embedOrder ∧ R.embedMeet

theorem lattice_representation_closed_from_evidence (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) (E : LatticeRepresentationEvidence L R) :
    LatticeRepresentationClosed L R := by
  exact And.intro E.orderReflexiveClosed
    (And.intro E.orderTransitiveClosed
      (And.intro E.orderAntisymmetricClosed
        (And.intro E.joinDefClosed
          (And.intro E.meetDefClosed
            (And.intro E.topBoundClosed
              (And.intro E.bottomBoundClosed
                (And.intro E.embedOrderClosed E.embedMeetClosed)))))))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse