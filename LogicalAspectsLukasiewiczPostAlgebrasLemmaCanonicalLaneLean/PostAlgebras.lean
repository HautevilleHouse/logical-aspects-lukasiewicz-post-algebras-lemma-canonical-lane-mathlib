import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure PostAlgebra (n : ℕ) extends LukasiewiczPostLattice where
  negation : carrier → carrier
  delta : carrier → carrier
  order_potent : carrier → ℕ → carrier
  negation_involutive : ∀ a : carrier, negation (negation a) = a
  delta_fixed_points : Δ : carrier → Prop
  order_potent_spec : ∀ a : carrier, ∀ k : ℕ, order_potent a k = sup a (order_potent a k.succ)
  delta_embedding : Δ → carrier

structure PostAlgebraEvidence {n : ℕ} (P : PostAlgebra n) where
  negation_involutive_closed : P.negation_involutive
  delta_fixed_points_closed : P.delta_fixed_points
  order_potent_spec_closed : P.order_potent_spec
  delta_embedding_closed : P.delta_embedding

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse