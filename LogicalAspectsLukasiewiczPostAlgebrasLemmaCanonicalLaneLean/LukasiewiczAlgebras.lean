import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure LukasiewiczAlgebra where
  carrier : Type u
  zero : carrier
  one : carrier
  impl : carrier → carrier → carrier
  neg : carrier → carrier
  axioms : Prop

def lukasiewicz_implication (a b : ℕ) : ℕ :=
  min 1 (1 - a + b)

theorem lukasiewicz_implication_spec (a b : ℕ) : lukasiewicz_implication a b = min 1 (1 - a + b) := rfl

structure LukasiewiczEvidence (L : LukasiewiczAlgebra) where
  zeroOneDistinct : L.zero ≠ L.one
  implClosed : ∀ x y : L.carrier, L.impl x y ∈ L.carrier
  negClosed : ∀ x : L.carrier, L.neg x ∈ L.carrier
  axiomsHeld : L.axioms

def LukasiewiczClosed (L : LukasiewiczAlgebra) : Prop :=
  L.axioms

theorem lukasiewicz_closed_from_evidence (L : LukasiewiczAlgebra) (E : LukasiewiczEvidence L) :
  LukasiewiczClosed L := by
  exact E.axiomsHeld

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse