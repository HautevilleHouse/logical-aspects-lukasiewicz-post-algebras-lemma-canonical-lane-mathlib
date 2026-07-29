import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.RepresentationTheorem

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure CompletenessPackage (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) where
  completenessStatement : Prop
  soundnessStatement : Prop
  completenessStatementTerm : completenessStatement
  soundnessStatementTerm : soundnessStatement

structure CompletenessEvidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) (C : CompletenessPackage L M P R) where
  completenessClosed : C.completenessStatement
  soundnessClosed : C.soundnessStatement

def CompletenessClosed (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) (C : CompletenessPackage L M P R) : Prop :=
  C.completenessStatement ∧ C.soundnessStatement

theorem completeness_closed_from_evidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) (C : CompletenessPackage L M P R) (E : CompletenessEvidence L M P R C) : CompletenessClosed L M P R C := by
  exact And.intro E.completenessClosed E.soundnessClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse