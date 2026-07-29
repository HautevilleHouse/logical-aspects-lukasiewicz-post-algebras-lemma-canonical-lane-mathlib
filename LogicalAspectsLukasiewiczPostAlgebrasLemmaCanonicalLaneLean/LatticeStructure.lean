import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczPostLatticePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  top : carrier
  bottom : carrier
  joinAssoc : ∀ x y z : carrier, join (join x y) z = join x (join y z)
  meetAssoc : ∀ x y z : carrier, meet (meet x y) z = meet x (meet y z)
  joinComm : ∀ x y : carrier, join x y = join y x
  meetComm : ∀ x y : carrier, meet x y = meet y x
  absorptionJoinMeet : ∀ x y : carrier, join x (meet x y) = x
  absorptionMeetJoin : ∀ x y : carrier, meet x (join x y) = x
  topJoin : ∀ x : carrier, join x top = top
  bottomMeet : ∀ x : carrier, meet x bottom = bottom
  distributivity : Prop

structure LatticeEvidence (L : LukasiewiczPostLatticePackage) where
  joinAssocClosed : L.joinAssoc
  meetAssocClosed : L.meetAssoc
  joinCommClosed : L.joinComm
  meetCommClosed : L.meetComm
  absorptionJoinMeetClosed : L.absorptionJoinMeet
  absorptionMeetJoinClosed : L.absorptionMeetJoin
  topJoinClosed : L.topJoin
  bottomMeetClosed : L.bottomMeet
  distributivityClosed : L.distributivity

def LatticeClosed (L : LukasiewiczPostLatticePackage) : Prop :=
  L.joinAssoc ∧ L.meetAssoc ∧ L.joinComm ∧ L.meetComm ∧
  L.absorptionJoinMeet ∧ L.absorptionMeetJoin ∧ L.topJoin ∧ L.bottomMeet ∧ L.distributivity

theorem lattice_closed_from_evidence (L : LukasiewiczPostLatticePackage)
    (E : LatticeEvidence L) : LatticeClosed L := by
  exact And.intro E.joinAssocClosed
    (And.intro E.meetAssocClosed
      (And.intro E.joinCommClosed
        (And.intro E.meetCommClosed
          (And.intro E.absorptionJoinMeetClosed
            (And.intro E.absorptionMeetJoinClosed
              (And.intro E.topJoinClosed
                (And.intro E.bottomMeetClosed E.distributivityClosed)))))))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse