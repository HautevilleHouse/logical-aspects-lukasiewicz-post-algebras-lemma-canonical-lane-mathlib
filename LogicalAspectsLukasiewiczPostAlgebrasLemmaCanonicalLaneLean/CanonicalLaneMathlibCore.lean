import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean

structure AdditiveLane (X : Type) [Add X] [Sub X] where
  state : X
  delta : X
  projection : X →o X
  xNext : X := state + projection delta
  carriedComponent : X := delta - projection delta
  x_next_eq : xNext = state + projection delta := rfl
  carried_component_eq : carriedComponent = delta - projection delta := rfl
  projection_idempotent_on_delta : projection (projection delta) = projection delta := by
    apply projection.idempotent

theorem projection_law (X : Type) [Add X] [Sub X] (L : AdditiveLane X) : L.xNext = L.state + L.projection L.delta := rfl

theorem carriage_law (X : Type) [Add X] [Sub X] (L : AdditiveLane X) : L.carriedComponent = L.delta - L.projection L.delta := rfl

theorem idempotence (X : Type) [Add X] [Sub X] (L : AdditiveLane X) : L.projection (L.projection L.delta) = L.projection L.delta := L.projection_idempotent_on_delta

end LogicalAspectsLukasiewiczPostAlgebrasLemmaCanonicalLaneLean
end HautevilleHouse