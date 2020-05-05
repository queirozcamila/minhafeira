class ShopsController < ApplicationController
  before_action :shop_find, only: [:show, :edit, :destroy]

  def index
    @shop = Shop.all
  end

  def show; end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user #devemos usar essa linha?
    if @shop.save
      redirect_to shop_path(@shop), notice: "Shop created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: "Shop updated!"
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_path
  end

  private

  def shop_find
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shops).permit(:name, :address, :description, :category, :user)
  end
end
