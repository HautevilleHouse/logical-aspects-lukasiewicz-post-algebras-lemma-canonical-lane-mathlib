import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean.MVAlgebra

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebrasLemmaPackage (M : MVAlgebraPackage) where
  iteratedNegation : M.lattice.carrier → ℕ → M.lattice.carrier
  fixpointProperty : Prop
  representationTheorem : Prop
  lemmaStatement : Prop

structure PostAlgebrasLemmaEvidence {M : MVAlgebraPackage} (P : PostAlgebrasLemmaPackage M) where
  fixpointPropertyClosed : P.fixpointProperty
  representationTheoremClosed : P.representationTheorem
  lemmaStatementClosed : P.lemmaStatement

def PostAlgebrasLemmaClosed {M : MVAlgebraPackage} (P : PostAlgebrasLemmaPackage M) : Prop :=
  MVAlgebraClosed M ∧ P.fixpointProperty ∧ P.representationTheorem ∧ P.lemmaStatement

theorem post_algebras_lemma_closed_from_evidence
    {M : MVAlgebraPackage} (P : PostAlgebrasLemmaPackage M)
    (E : PostAlgebrasLemmaEvidence P) (MV : MVAlgebraEvidence M) (L : LatticeEvidence M.lattice) :
    PostAlgebrasLemmaClosed P := by
  have MVc : MVAlgebraClosed M := mv_algebra_closed_from_evidence M MV L
  exact And.intro MVc (And.intro E.fixpointPropertyClosed (And.intro E.representationTheoremClosed E.lemmaStatementClosed))

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse