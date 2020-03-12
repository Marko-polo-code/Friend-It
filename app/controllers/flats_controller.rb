class FlatsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @flats = Flat.geocoded #returns flats with coordinates
    @markers = @flats.map do |flat|
      if flat.user.photo.attached?
        url = "https://res.cloudinary.com/dncij7vr6/image/upload/" + flat.user.photo.key + ".jpg"
      else
        url = "https://image.flaticon.com/icons/svg/147/147144.svg"
      end
      {
        lat: flat.latitude,
        lng: flat.longitude,
        image_url: url

      }
    end

    if params[:query].present?
      @flats = Flat.search_by_address_and_owner(params[:query])
    else
      @flats = Flat.all
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to new_flat_recommendation_path(@flat)
    else
      render :new
    end
  end

  def update
    set_flat
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def edit
    set_flat
  end

  def destroy
    set_flat
    authorize @flat
    @flat.destroy
  end

  def info
    @flat = Flat.find(params[:flat_id])
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :swappable, :price, :description, :title, :number_of_bathrooms, :number_of_bedrooms, :number_of_beds, :number_of_guests)
  end
end

