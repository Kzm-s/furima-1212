class ItemsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
        @user = User.all
        @items = Item.all.order(created_at: :desc)
    end

    def new
        @item = Item.new
    end

    def show
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

    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to item_path
        else
            render :edit
        end
    end

    def destroy
        if @item.user_id == current_user.id
            @item.destroy
            redirect_to root_path
        else
            redirect_to item_path
        end
    end

    private
    def item_params
        params.require(:item).permit(:name, :description, :category_id, :status_id, :burde_id, :area_id, :day_id, :price, :image
        ).merge(user_id: current_user.id)
    end

    def set_item
        @item = Item.find(params[:id])
    end
end
