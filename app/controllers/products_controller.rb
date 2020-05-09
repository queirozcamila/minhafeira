
class ProductsController < ApplicationController
  before_action :product_find, only: [:edit, :update, :destroy]
  before_action :shop_find, only: [:update, :new, :destroy]



  def new
    @product = Product.new
    @product.shop_id = params[:shop_id]
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]
    authorize @product


    if @product.save
      redirect_to shop_path(params[:shop_id])

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
    redirect_to shop_path(@product.shop)
  end

  private

  def shop_find
    @shop = Shop.find(params[:shop_id])
    authorize @shop
  end

  def product_find
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :photo, :shop_id)
  end
end
