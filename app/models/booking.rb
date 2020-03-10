class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :swap_request, optional: true
  # swap_request_id is not mandatory, it's used to identify the swap_request

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :total_price, presence: true

  before_validation :set_total_price

  def set_total_price
    self.status = "pending"
    self.total_price = ((self.end_date - self.start_date).to_i + 1)* self.flat.price
  end
end
