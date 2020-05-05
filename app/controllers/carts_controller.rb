class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def update
    @cart = Cart.new
    @cart.update(cart_params)
  end

  private

  def cart_params
    params.require(cart).permit(:user_id, :status)
  end
end
