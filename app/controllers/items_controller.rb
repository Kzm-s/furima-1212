class ItemsController < ApplicationController
    def index
        @user = User.all
        @items = Item.all
    end
end
