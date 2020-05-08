class ProductsController < ApplicationController
  before_action :product_find, only: [:edit, :update, :destroy]
  before_action :shop_find, only: [:update]


  def new
    @product = Product.new
    authorize @product
  end

  def create
    @shop = Shop.find(params[:shop_id])
    authorize @shop
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]
    if @product.save
      redirect_to shops_path
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
    authorize @product
  end

  private

  def shop_find
    @shop = Shop.find(Product.find(params[:id]).shop_id)
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
