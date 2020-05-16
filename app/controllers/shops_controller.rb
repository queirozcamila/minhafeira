class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :shop_find, only: [:show, :edit, :update, :destroy]

  def index
    # Recomendo comentar a linha 9 do ApplicationController,
    # e então comentar essa linha que tá usando policy_scope.

    # Estamos fazendo uma query a mais sem necessidade ~__~
    @shop = policy_scope(Shop).order(created_at: :desc)

    @shops = Shop.geocoded

    if params[:query].present?
      @shops = Shop.global_search(params[:query])
    elsif params[:lat] && params[:lng]
      lat = params[:lat].to_f
      lng = params[:lng].to_f

      # Cuidado com possíveis exceções O:

      @shops = Shop.near([lat, lng], 2)
    end

    @shops = @shops.order(created_at: :desc)

    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
        image_url: helpers.asset_url('minha_feira_navbar.png')
      }
    end

    respond_to do |format|
      format.html
      format.js { render json: @markers }
    end
  end

  def show
    authorize @shop
  end

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
