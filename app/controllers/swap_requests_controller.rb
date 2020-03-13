class SwapRequestsController < ApplicationController
  def create
    @swap_request = SwapRequest.new(swap_request_params)

    @swap_request.requested_flat =  Flat.find(params[:flat_id].to_i)
    @swap_request.requester_flat = Flat.find(params[:swap_request][:requester_flat_id].to_i)
    @swap_request.status = "pending"
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
    swap_request = SwapRequest.find(params[:swap_request_id])
    swap_request.status = "accepted"
    swap_request.save

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
    redirect_to admin_dashboard_path, notice: "Swap Accepted"
  end

  def reject
    swap_request = SwapRequest.find(params[:swap_request_id])
    swap_request.status = "rejected"
    swap_request.save
    redirect_to admin_dashboard_path, notice: "Swap Rejected"

  end



  private

  def swap_request_params
    params.require(:swap_request).permit(:start_date, :end_date)
  end
end
