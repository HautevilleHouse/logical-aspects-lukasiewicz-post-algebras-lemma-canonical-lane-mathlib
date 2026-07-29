import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.PostAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure RepresentationPackage (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) where
  representationMap : L.carrier → (Nat → L.carrier)
  mapIsomorphism : Prop
  mapOrderPreserving : Prop
  representationLemma : Prop
  mapIsomorphismTerm : mapIsomorphism
  mapOrderPreservingTerm : mapOrderPreserving
  representationLemmaTerm : representationLemma

structure RepresentationEvidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) where
  mapIsomorphismClosed : R.mapIsomorphism
  mapOrderPreservingClosed : R.mapOrderPreserving
  representationLemmaClosed : R.representationLemma

def RepresentationClosed (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) : Prop :=
  R.mapIsomorphism ∧ R.mapOrderPreserving ∧ R.representationLemma

theorem representation_closed_from_evidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (R : RepresentationPackage L M P) (E : RepresentationEvidence L M P R) : RepresentationClosed L M P R := by
  exact And.intro E.mapIsomorphismClosed (And.intro E.mapOrderPreservingClosed E.representationLemmaClosed)

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse