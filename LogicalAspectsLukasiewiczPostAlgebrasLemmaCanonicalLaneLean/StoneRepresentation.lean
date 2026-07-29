import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure StoneRepresentation (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) where
  primeFilters : Type u
  primeFilterProperty : ∀ (F : primeFilters), ∀ x y : R.representation, R.join x y ∈ F ↔ x ∈ F ∨ y ∈ F
  representationIso : R.representation ≃ Set primeFilters
  representationIsoOrder : ∀ x y : R.representation, R.order x y ↔ (representationIso x) ⊆ (representationIso y)

structure StoneRepresentationEvidence (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) (S : StoneRepresentation L R) where
  primeFilterPropertyClosed : S.primeFilterProperty
  representationIsoOrderClosed : S.representationIsoOrder

def StoneRepresentationClosed (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) (S : StoneRepresentation L R) : Prop :=
  S.primeFilterProperty ∧ S.representationIsoOrder

theorem stone_representation_closed_from_evidence (L : LukasiewiczAlgebra) (R : LatticeRepresentation L) (S : StoneRepresentation L R) (E : StoneRepresentationEvidence L R S) :
    StoneRepresentationClosed L R S := by
  exact And.intro E.primeFilterPropertyClosed E.representationIsoOrderClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse