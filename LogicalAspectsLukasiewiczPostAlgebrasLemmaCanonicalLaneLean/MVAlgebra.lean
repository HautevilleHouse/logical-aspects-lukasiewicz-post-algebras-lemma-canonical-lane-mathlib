import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.LatticeStructure

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure MVAlgebraPackage where
  lattice : LukasiewiczPostLatticePackage
  implication : lattice.carrier → lattice.carrier → lattice.carrier
  negation : lattice.carrier → lattice.carrier
  implDef : Prop
  negDef : Prop
  lukasiewiczAxioms : Prop

structure MVAlgebraEvidence (M : MVAlgebraPackage) where
  implDefClosed : M.implDef
  negDefClosed : M.negDef
  lukasiewiczAxiomsClosed : M.lukasiewiczAxioms

def MVAlgebraClosed (M : MVAlgebraPackage) : Prop :=
  LatticeClosed M.lattice ∧ M.implDef ∧ M.negDef ∧ M.lukasiewiczAxioms

theorem mv_algebra_closed_from_evidence (M : MVAlgebraPackage)
    (E : MVAlgebraEvidence M) (L : LatticeEvidence M.lattice) : MVAlgebraClosed M := by
  have Lc : LatticeClosed M.lattice := lattice_closed_from_evidence M.lattice L
  exact And.intro Lc (And.intro E.implDefClosed (And.intro E.negDefClosed E.lukasiewiczAxiomsClosed))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse