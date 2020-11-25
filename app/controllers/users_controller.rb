class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        # @orders = Order.where(user_id: @user.id)
        # @orders.each do |order|
        #     @orderitems = OrderItem.where(order_id: order.id)
        #     @orderitems.each do |orderitem|
        #       @products_title << Product.find(orderitem.product_id).title
        #       @products_description << Product.find(orderitem.product_id).description
        #       @products_price << Product.find(orderitem.product_id).price
        #       attachments.inline[Product.find(orderitem.product_id).image.name + ".png"] = url_for(Product.find(orderitem.product_id).image)
        #     end
        # end
    end
end
