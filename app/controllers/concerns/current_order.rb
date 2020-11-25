module CurrentOrder

	def set_order
	    if !session[:order_id].nil?
      	@order = Order.find(session[:order_id])
	    else
      	@order = Order.create
        end
	end

end



