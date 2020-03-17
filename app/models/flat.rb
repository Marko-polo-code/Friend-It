class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :swap_requests
  has_many :contacts
  has_many :flat_perks
  has_many :perks, through: :flat_perks
  has_many :recommendations
  has_many_attached :photos
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :number_of_bedrooms, presence: true
  validates :number_of_guests, presence: true
  validates :number_of_beds, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  accepts_nested_attributes_for :flat_perks


  include PgSearch::Model
  pg_search_scope :search_by_address_and_owner,
    against: [ :address ],
      associated_against: {
        user: [ :first_name, :last_name, :email ]
      },
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
