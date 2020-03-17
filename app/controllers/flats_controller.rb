class FlatsController < ApplicationController
  # skip_before_action :authenticate_user!

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
    @markers = [@flat].map do |flat|
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
  end

  def new
    @flat = Flat.new
    @flat.flat_perks.build
    @markers = []
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      create_flat_perks(@flat)
      redirect_to flat_path(@flat)
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
    @markers = @flat.recommendations.map { |rec| { lat: rec.latitude  , lng: rec.longitude } }
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :swappable, :price, :description, :title, :number_of_bathrooms, :number_of_bedrooms, :number_of_beds, :number_of_guests, photos: [], flat_perk: [])
  end

  def create_flat_perks(flat)
    params[:flat][:flat_perk][:perk].reject(&:blank?).each do |id_or_name|
      if id_or_name.to_i > 0
        FlatPerk.create(perk_id: id_or_name, flat: flat)
      else
        perk = Perk.new(name: id_or_name)
        unless perk.save
          raise
        end
        fp = FlatPerk.new(perk: perk, flat:flat)
        unless fp.save
          raise
        end
        end
    end
  end
end

