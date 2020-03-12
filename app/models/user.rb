class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats
  has_many :swap_requests, through: :flats
  has_many :bookings
  has_one_attached :photo
  has_friendship


  include PgSearch::Model
  pg_search_scope :search_by_user,
    against: [ :email, :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }

end
