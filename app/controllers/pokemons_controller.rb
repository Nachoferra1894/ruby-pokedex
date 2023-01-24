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

    def add_images
        @pokemon = Pokemon.find(params[:id])
        @pokemon.pokemon_images.attach(params[:pokemon_images])
        render json: @pokemon.pokemon_images
    end

    def show_images
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon.pokemon_images
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

    private 
        def pokemon_params
            params.require(:pokemon).permit(:identifier, :height, :weight, :base_experience, :is_default, pokemon_images: [])
        end
end
