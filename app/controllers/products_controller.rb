class ProductsController < ApplicationController
  before_action :product_find, only: [:edit, :update, :destroy]
  before_action :shop_find, only: [:update, :create]


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
  end

  private

  def shop_find
    @shop = Shop.find(params[:shop_id])
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:products).permit(:name, :description, :price, :category, :photo, :shop_id)
  end
end
