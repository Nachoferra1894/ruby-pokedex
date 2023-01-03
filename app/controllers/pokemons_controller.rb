class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
    end
    
    def show
    end

    def showByName
        @pokemon = Pokemon.find_by(name: params[:name])
    end

    def showByType
        @pokemon = Pokemon.joins(:types).where(types: { name: type })
    end
end
