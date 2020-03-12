class SwapRequestsController < ApplicationController
  def create
    @swap_request = SwapRequest.new(swap_request_params)

    @swap_request.requested_flat =  Flat.find(params[:flat_id].to_i)
    @swap_request.requester_flat = Flat.find(params[:swap_request][:requester_flat_id].to_i)
    if @swap_request.save
    redirect_to flat_path(params[:flat_id])
    else
      raise
    end
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @swap_request = SwapRequest.new
  end

  def accept
    swap_request = SwapRequest.find(params[:id])
    booking_one = Booking.new(status: "accepted",
                          start_date: swap_request.start_date,
                          end_date: swap_request.end_date,
                          flat: swap_request.requested_flat,
                          user: swap_request.requester_flat.user,
                          total_price: 0,
                          number_of_guests: 1
                          )
                          raise unless booking_one.save

    booking_two = Booking.new(status: "accepted",
                          start_date: swap_request.start_date,
                          end_date: swap_request.end_date,
                          flat: swap_request.requester_flat,
                          user: swap_request.requested_flat.user,
                          total_price: 0,
                          number_of_guests: 1
                          )
                          raise unless booking_two.save

                          swap_request.destroy
    redirect_to dashboard_path
  end



  private

  def swap_request_params
    params.require(:swap_request).permit(:start_date, :end_date)
  end
end
