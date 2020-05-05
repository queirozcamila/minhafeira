class ProductsController < ApplicationController
  before_action :product_find, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def edit
  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy
  end

  private

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:products).permit(:name, :description, :price, :category, :photo, :shop_id)
  end
end
