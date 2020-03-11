class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard 
    @flats = current_user.flats
    @made_bookings = current_user.bookings
  end

  def admin_dashboard 
    @swap_requests = current_user.swap_requests
    @flats = current_user.flats
    @received_bookings = @flats.map { |flat| flat.bookings }.flatten
  end
end
