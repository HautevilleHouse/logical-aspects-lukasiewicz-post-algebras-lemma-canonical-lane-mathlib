import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczPostLattice where
  carrier : Type u
  le : carrier → carrier → Prop
  top : carrier
  bottom : carrier
  sup : carrier → carrier → carrier
  inf : carrier → carrier → carrier
  le_refl : ∀ a : carrier, le a a
  le_trans : ∀ a b c : carrier, le a b → le b c → le a c
  le_antisymm : ∀ a b : carrier, le a b → le b a → a = b
  sup_le : ∀ a b c : carrier, le a c → le b c → le (sup a b) c
  le_sup_left : ∀ a b : carrier, le a (sup a b)
  le_sup_right : ∀ a b : carrier, le b (sup a b)
  inf_le_left : ∀ a b : carrier, le (inf a b) a
  inf_le_right : ∀ a b : carrier, le (inf a b) b
  le_inf : ∀ a b c : carrier, le a b → le a c → le a (inf b c)
  top_le : ∀ a : carrier, le a top
  le_bottom : ∀ a : carrier, le bottom a

structure LukasiewiczPostLatticeEvidence (L : LukasiewiczPostLattice) where
  le_refl_closed : L.le_refl
  le_trans_closed : L.le_trans
  le_antisymm_closed : L.le_antisymm
  sup_le_closed : L.sup_le
  le_sup_left_closed : L.le_sup_left
  le_sup_right_closed : L.le_sup_right
  inf_le_left_closed : L.inf_le_left
  inf_le_right_closed : L.inf_le_right
  le_inf_closed : L.le_inf
  top_le_closed : L.top_le
  le_bottom_closed : L.le_bottom

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse