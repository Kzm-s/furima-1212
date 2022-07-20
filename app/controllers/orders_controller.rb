class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new
    end

    def create
        
        binding.pry
        
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new(order_params)        
        if @order_address.valid?
            pay_item
            @order_address.save
            redirect_to root_path
        else
            render :index
        end
    end

    def order_params
        params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
            amount: order_params[:price],  # 商品の値段
            card: order_params[:token],    # カードトークン
            currency: 'jpy'                 # 通貨の種類（日本円）
        )
    end


    

end
