class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :swap_request
end
