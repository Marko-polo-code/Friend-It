class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  # belongs_to :swap_request
  # swap_request_id is not mandatory, it's used to identify the swap_request

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :total_price, presence: true
end
