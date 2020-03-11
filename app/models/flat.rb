class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :swap_requests
  has_many :contacts
  has_many :flat_perks
  has_many :perks, through: :flat_perks
  has_many :recommendations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :number_of_bedrooms, presence: true
  validates :number_of_guests, presence: true
  validates :number_of_beds, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_address_and_owner,
    against: [ :address ],
      associated_against: {
        user: [ :first_name, :last_name, :email ]
      },
    using: {
      tsearch: { prefix: true }
    }
end
