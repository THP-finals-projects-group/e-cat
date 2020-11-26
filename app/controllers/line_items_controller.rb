class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_line_item, only: [:show, :edit, :update]
  before_action :set_cart, only: [:create, :edit]
  before_action :authenticate_user!, only: [:new, :create, :index, :edit, :update, :destroy]


  def index
    @line_items = LineItem.all
  end


  def new
    @line_item = LineItem.new
  end


  def create

    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'Produit ajouté au panier !' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(quantity: @line_item.quantity - 1)
    @cart = Cart.find(current_user.id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    @cart = Cart.find(current_user.id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:cart_id, :product_id, :quantity)
    end
end
