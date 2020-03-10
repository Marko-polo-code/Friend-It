class SwapRequest < ApplicationRecord
  belongs_to :requester_flat, class_name: "Flat"
  belongs_to :requested_flat, class_name: "Flat"

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  validate :check_if_swappable

  def check_if_swappable
    if self.requested_flat.swappable == false &&  self.requester_flat.swappable == false
      errors.add(:requester_flat, "Your flats are not swappable")
    elsif self.requester_flat.swappable == false
      errors.add(:requester_flat, "Your flat is not swappable")
    elsif self.requested_flat.swappable == false
      errors.add(:requester_flat, "The other flat is not swappable")
    end
  end
end
