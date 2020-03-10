class Recommendation < ApplicationRecord
  belongs_to :flat

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
