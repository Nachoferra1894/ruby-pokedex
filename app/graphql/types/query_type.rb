module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: true, description: "Returns a list of users"
    def users
      User.all
    end

    field :pokemons, [Types::PokemonType], null: true, description: "Returns a list of pokemons"
    def pokemons
      Pokemon.all
    end

    field :types, [Types::TypeType], null: true, description: "Returns a list of types"
    def types
      Types.all
    end
  end
end
