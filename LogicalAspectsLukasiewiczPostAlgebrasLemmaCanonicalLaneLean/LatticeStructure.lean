import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczLatticePackage where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  bounded : Prop
  distributive : Prop
  boundedTerm : bounded
  distributiveTerm : distributive

structure PostLatticePackage (L : LukasiewiczLatticePackage) where
  chainCondition : Prop
  finiteHeight : Prop
  chainConditionTerm : chainCondition
  finiteHeightTerm : finiteHeight

structure LatticeEvidence (L : LukasiewiczLatticePackage) where
  boundedClosed : L.bounded
  distributiveClosed : L.distributive

def LatticeClosed (L : LukasiewiczLatticePackage) : Prop :=
  L.bounded ∧ L.distributive

theorem lattice_closed_from_evidence (L : LukasiewiczLatticePackage) (E : LatticeEvidence L) : LatticeClosed L := by
  exact And.intro E.boundedClosed E.distributiveClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse