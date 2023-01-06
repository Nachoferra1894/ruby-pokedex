class PokemonSerializer < ActiveModel::Serializer
  has_many :types
  has_many :abilities
  attributes :id, :pokemon_name, :height, :weight, :types, :abilities

  # Renaming the identifier attribute to pokemon_name
  def pokemon_name
    object.identifier
  end
end
