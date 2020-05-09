class CartProductsController < ApplicationController
skip_before_action :authenticate_user!

def create
  # se o current user não tiver cart, cart new
  # se o current user tiver e o status for fechado, criar novo cart
  # se o current user tiver cart, use o último

  if current_user.carts.empty? || current_user.carts.last.status == "closed"
    @cart = Cart.new
    @cart.user = current_user
    @cart.save
  else
    @cart = @curent_user.cart.last
  end
  @cart_product = CartProduct.new(cart_products_params)
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

