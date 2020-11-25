class OrderMailer < ApplicationMailer
  def order_mail(order)
    @user = User.find(order.user_id)
    @order = Order.find(order.id)
    @products_title = []
    @products_description = []
    @products_price = []
    @orderitems = OrderItem.where(order_id: order.id)
    @orderitems.each do |orderitem|
      @products_title << Product.find(orderitem.product_id).title
      @products_description << Product.find(orderitem.product_id).description
      @products_price << Product.find(orderitem.product_id).price
      attachments.inline[Product.find(orderitem.product_id).image.name + ".png"] = Product.find(orderitem.product_id).image.download()
    end


    @url = "https://dev-e-cat.herokuapp.com/"   

    #attachments[@product.image.name + ".png"] = to_png(@product.image) 
    mail(
      from: "dev-a-cat@yopmail.com", 
      to: @user.email,
      subject: "Félicitation pour votre a-chat de chat !",
      delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET_KEY'] }
    )
    
  end
end
