import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.MVAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebraPackage (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) where
  center : L.carrier → Prop
  centerInvolution : L.carrier → L.carrier
  postAxioms : Prop
  postAxiomsTerm : postAxioms

structure PostAlgebraEvidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) where
  postAxiomsClosed : P.postAxioms

def PostAlgebraClosed (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) : Prop :=
  P.postAxioms

theorem post_algebra_closed_from_evidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (P : PostAlgebraPackage L M) (E : PostAlgebraEvidence L M P) : PostAlgebraClosed L M P := by
  exact E.postAxiomsClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse