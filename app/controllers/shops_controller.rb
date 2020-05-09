class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :shop_find, only: [:show, :edit, :update, :destroy]

  def index
    @shop = policy_scope(Shop).order(created_at: :desc)

    @shops = Shop.geocoded # returns flats with coordinates

    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop })
      }
    end
  end

  def show; end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    authorize @shop
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
    authorize @shop
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :description, :category, :user)
  end

end
