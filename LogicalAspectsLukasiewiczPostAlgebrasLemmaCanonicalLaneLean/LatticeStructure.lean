import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczLattice (A : AdmissibleClass) where
  carrier : Type u
  join : carrier → carrier → carrier
  meet : carrier → carrier → carrier
  top : carrier
  bottom : carrier
  join_comm : ∀ a b, join a b = join b a
  join_assoc : ∀ a b c, join (join a b) c = join a (join b c)
  meet_comm : ∀ a b, meet a b = meet b a
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  absorption_join_meet : ∀ a b, join a (meet a b) = a
  absorption_meet_join : ∀ a b, meet a (join a b) = a
  top_join : ∀ a, join a top = top
  bottom_meet : ∀ a, meet a bottom = bottom

structure LatticeEvidence (A : AdmissibleClass) (L : LukasiewiczLattice A) where
  join_comm_closed : L.join_comm = L.join_comm
  meet_comm_closed : L.meet_comm = L.meet_comm

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse