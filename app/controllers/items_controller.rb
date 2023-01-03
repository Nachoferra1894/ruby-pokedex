class ItemsController < ApplicationController
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
