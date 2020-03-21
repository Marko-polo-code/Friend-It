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

  before_create :generate_referral_token

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

  def generate_referral_token
    self.referral_token = SecureRandom.urlsafe_base64(6)
    generate_referral_token if User.exists?(referral_token: referral_token)
  end

  def connections
    friends.map { |friend| friend.friends }.flatten.uniq - [self]
  end
end
