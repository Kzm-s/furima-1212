class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @order = Order.new
    end

end
