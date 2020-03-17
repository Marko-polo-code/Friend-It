class BookingsController < ApplicationController


# OLD SHOW METHOD
#   # def show
#   #   @booking = Booking.find(params[:id])
#   # end
# END OF OLD SHOW METHOD

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    flat = Flat.find(params[:flat_id])
    booking = Booking.new(booking_params)
    booking.flat = flat
    booking.user = current_user
    rental_period = booking.end_date - booking.start_date
    booking.amount = flat.price*rental_period
    booking.save
    booking.update(status: 'pending')

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: flat.title,
        amount: booking.amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: booking_url(booking),
      cancel_url: booking_url(booking)
    )

    booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(booking)

  end

# OLD CREATE METHOD

  # def create
  #   @booking = Booking.new(booking_params)
  #   # @booking.set_total_price
  #   @flat = Flat.find(params[:flat_id])
  #   @booking.flat = @flat
  #   @booking.user = current_user
  #   if @booking.save
  #     redirect_to booking_path(@booking)
  #   else
  #     render "flats/show"
  #   end
  # end


  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path, notice: "Booking accepted"
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path, notice: "Booking rejected"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date )
  end
end



