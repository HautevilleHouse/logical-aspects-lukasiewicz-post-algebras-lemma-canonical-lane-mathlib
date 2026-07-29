import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure MVAlgebraPackage (L : LukasiewiczLatticePackage) where
  negation : L.carrier → L.carrier
  implication : L.carrier → L.carrier → L.carrier
  mvAxioms : Prop
  mvAxiomsTerm : mvAxioms

structure MVAlgebraEvidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) where
  mvAxiomsClosed : M.mvAxioms

def MVAlgebraClosed (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) : Prop :=
  M.mvAxioms

theorem mv_algebra_closed_from_evidence (L : LukasiewiczLatticePackage) (M : MVAlgebraPackage L) (E : MVAlgebraEvidence L M) : MVAlgebraClosed L M := by
  exact E.mvAxiomsClosed

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse