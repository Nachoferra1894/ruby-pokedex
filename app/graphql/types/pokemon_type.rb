# frozen_string_literal: true

module Types
  class PokemonType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :species_id, Integer
    field :height, Integer, null: false
    field :weight, Integer, null: false
    field :base_experience, Integer, null: false
    field :order, Integer, null: false
    field :is_default, Boolean, null: false
  end
end
