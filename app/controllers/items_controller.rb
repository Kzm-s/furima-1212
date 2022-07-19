class ItemsController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index
        @user = User.all
        @items = Item.all.order(created_at: :desc)
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if @item.valid?
            @item.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :category_id, :status_id, :burde_id, :area_id, :day_id, :price, :image
        ).merge(user_id: current_user.id)
    end
end
