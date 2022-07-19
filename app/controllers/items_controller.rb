class ItemsController < ApplicationController
    def index
        @user = User.all
        @items = Item.all
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :category_id, :status_id, :burde_id, :area_id, :day_id, :price, :image
        ).merge(user_id: current_user.id)
        end
end
