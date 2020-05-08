class CartProductsController < ApplicationController
skip_before_action :authenticate_user!

def create
  # se o current user não tiver cart, cart new
  # se o current user tiver, conecta cart_product ao cart
  (@cart = Cart.new) if current_user.cart.count == 0
  @cart_product = CartProduct.new(cart_products_params)
  @cart_product.cart = @cart
  if @cart_product.save
    redirect_to cart_path(@cart_product)
  else
    render 'new'
  end
end


def edit
  @cart_product = CartProduct.find(params[:id])
end

def update
  @cart_product = CartProduct.find(params[:id])
  @cart_product.update(cart_product_params)
  redirect_to shop_path(@shop)
end



def destroy
  @cart_product = CartProduct.find(params[:id])
  @cart_product.destroy
  redirect_to shops_path
end


private


def cart_products_params
  params.require(:cart_product).permit(:cart_id, :product_id, :quantity)
end


end

