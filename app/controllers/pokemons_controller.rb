class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
        render json: @pokemons
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon
    end

    def showByName
        @pokemon = Pokemon.find_by(identifier: params[:name])
        render json: @pokemon
    end

    def showByType
        @pokemon = Type.find_by(identifier: params[:type])
        if @pokemon
            render json: @pokemon.pokemons
        else
            render json: {error: "No pokemon found with type #{params[:type]}"}
        end
    end
end
