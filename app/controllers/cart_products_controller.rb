class CartProductsController < ApplicationController



def create
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

