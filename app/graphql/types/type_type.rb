# frozen_string_literal: true

module Types
  class TypeType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :generation_id, Integer, null: false
    field :damage_class_id, Integer
  end
end
