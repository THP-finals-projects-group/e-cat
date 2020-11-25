class OrdersController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:new, :create, :edit]
	
	def index
	  @orders = Order.all
	end

	def show
	  @order = Order.find(params[:id])
	end

	def new
	  @order = Order.new
	  @amount = @cart.total.to_i
	  session[:price] = @cart.total.to_i
 
	end

	def create
		@amount = session[:price]
		@lineitems = LineItem.where(cart_id: @cart.id)

		customer = Stripe::Customer.create({
            email: params[:stripeEmail],
            source: params[:stripeToken],
        })
                                         
        charge = Stripe::Charge.create({
            customer: customer.id,
            amount: @amount,
            description: 'Rails Stripe customer',
            currency: 'eur',
		})
		@order = Order.new(user_id: current_user.id)
		if @order.save

			@lineitems.each do |lineitem|
				OrderItem.create(order_id: @order.id, product_id: lineitem.product_id, quantity: lineitem.quantity)
			end

			@cart.destroy

			puts "saved"
			redirect_to orders_path, :notice => 'Participation enregisté !'
			flash[:notive] = "Participation créé !"
		  else
			puts "ça n'a pas fonctionne,essaie encore"
			puts @order.errors.messages
			flash.now[:alert] = "We cannot create this event for this reason(s) :"
			render 'new'
		  end

			rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to root_path
	
			session.delete(:price)
	end

	private
	  def order_params
	    params.require(:order).permit(:user_id, :line_items_id)
	  end
end
