class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @carts = current_user.carts
  end

  def show
    @cart = Cart.find(params[:id])
    @cart_products = @cart.cart_products
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
  end

  private

  def cart_params
    params.require(cart).permit(:user_id, :status)
  end
end
