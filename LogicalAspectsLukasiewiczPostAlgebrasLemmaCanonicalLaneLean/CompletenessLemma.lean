import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure CompletenessLemma (L : LukasiewiczAlgebra) (P : PostAlgebra L) where
  representation : LatticeRepresentation L
  semantics : Type u
  valuation : semantics → L.carrier → Prop
  valuationExtensional : ∀ (v : semantics) (a b : L.carrier), (∀ x : representation.representation, true) → valuation v a = valuation v b
  completenessStatement : ∀ (a : L.carrier), (∀ v : semantics, valuation v a) → a = L.one
  soundness : ∀ (a : L.carrier), a = L.one → (∀ v : semantics, valuation v a)

structure CompletenessLemmaEvidence (L : LukasiewiczAlgebra) (P : PostAlgebra L) (C : CompletenessLemma L P) where
  completenessStatementClosed : C.completenessStatement
  soundnessClosed : C.soundness

def CompletenessLemmaClosed (L : LukasiewiczAlgebra) (P : PostAlgebra L) (C : CompletenessLemma L P) : Prop :=
  C.completenessStatement ∧ C.soundness

theorem completeness_lemma_closed_from_evidence (L : LukasiewiczAlgebra) (P : PostAlgebra L) (C : CompletenessLemma L P) (E : CompletenessLemmaEvidence L P C) :
    CompletenessLemmaClosed L P C := by
  exact And.intro E.completenessStatementClosed E.soundnessClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse