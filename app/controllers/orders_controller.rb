class OrdersController < ApplicationController
	
	def index
	  @orders = Order.all
	end

	def show
	  @order = Order.find(params[:id])
	end

	def new
	  @order = Order.new
	end

	def create
	  @order = Order.new(user_id: current_user.id, address: Address.where(user_id:current_user.id))
	  @order.save
	end

	private
	  def order_params
	    params.require(:order).permit(:user_id, :line_items_id)
	  end
end



#def create
#  @order = Order.new(order_params)
#  @current_cart.line_items.each do |item|
#    @order.line_items << item
#    item.cart_id = nil
#  end
#  @order.save
#  Cart.destroy(session[:cart_id])
#  session[:cart_id] = nil
#  redirect_to root_path
#end
