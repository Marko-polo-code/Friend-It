class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :swap_request, optional: true
  # swap_request_id is not mandatory, it's used to identify the swap_request

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validates :total_price, presence: true
  validate :end_date_after_start_date


  before_validation :set_total_price, on: :create

  monetize :amount_cents


  def set_total_price
    self.status = "pending"
    self.total_price = ((self.end_date - self.start_date).to_i + 1)* self.flat.price
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
