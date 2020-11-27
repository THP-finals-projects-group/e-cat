class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @orders = Order.where(user_id: @user.id).includes(:order_items, :products)
    end
end
