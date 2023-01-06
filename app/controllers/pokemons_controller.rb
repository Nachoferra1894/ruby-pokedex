class PokemonsController < ApplicationController
    before_action :authenticate_request
    
    def index
        @pagy, @pokemons = paginate(Pokemon.all)
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
        @type = Type.find_by(identifier: params[:type])
        if @type
            @pagy, @pokemon = paginate(@type.pokemons)
            render json: @pokemon
        else
            render json: {error: "No pokemon found with type #{params[:type]}"}
        end
    end
end
