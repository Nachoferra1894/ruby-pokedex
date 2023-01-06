class ItemsController < ApplicationController
    before_action :authenticate_request
    
    def index 
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def showByName
        @item = Item.find_by(name: params[:name])
    end

    def showByCateogry
        @item = Item.where(category: params[:category])
    end
end
