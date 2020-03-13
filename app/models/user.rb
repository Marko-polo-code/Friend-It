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

  def common_friends(other_user)
    current_user_friends_id = self.friends.pluck(:id)
    other_user_friends_id = other_user.friends.pluck(:id)
    current_user_friends_id.select! { |id| other_user_friends_id.include?(id)}
    User.where(id: current_user_friends_id)
  end
end
