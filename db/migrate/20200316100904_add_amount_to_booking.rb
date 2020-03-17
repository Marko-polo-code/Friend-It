class AddAmountToBooking < ActiveRecord::Migration[5.2]
  def change
    add_monetize :bookings, :amount, currency: { present: false }
  end
end
