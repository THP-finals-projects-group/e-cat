class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @orders = Order.where(user_id: @user.id).includes(:order_items, :products)

        @products_title = []
        @products_price = []
        @products_quantity = []
        @orders.each do |order|
            @orderitems = OrderItem.where(order_id: order.id)
            @orderitems.each do |orderitem|
                @products_title << Product.find(orderitem.product_id).title
                @products_quantity << orderitem.quantity
                @products_price << Product.find(orderitem.product_id).price
            end
        end
    end
end
