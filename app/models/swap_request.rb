class SwapRequest < ApplicationRecord
  belongs_to :requester_flat, class_name: "Flat"
  belongs_to :requested_flat, class_name: "Flat"

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date


  # validate :check_if_swappable

  def check_if_swappable
    if self.requested_flat.swappable == false &&  self.requester_flat.swappable == false
      errors.add(:requester_flat, "Your flats are not swappable")
    elsif self.requester_flat.swappable == false
      errors.add(:requester_flat, "Your flat is not swappable")
    elsif self.requested_flat.swappable == false
      errors.add(:requester_flat, "The other flat is not swappable")
    end
  end
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
