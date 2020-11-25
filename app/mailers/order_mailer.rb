class OrderMailer < ApplicationMailer
  def order_mail
    @user = User.last
    @product = Product.last
    @url = "https://dev-e-cat.herokuapp.com/"
    attachments[@product.image.name + ".png"] = to_png(@product.image)
    mail(
      from: "dev-a-cat@yopmail.com", 
      to: @user.email,
      subject: "Félicitation pour votre a-chat de chat !",
      delivery_method_options: { api_key: ENV['MAILJET_API'], secret_key: ENV['MAILJET_SECRET_KEY'] }
    )
    
  end
end
