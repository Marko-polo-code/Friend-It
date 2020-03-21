class Contact < ApplicationRecord
  belongs_to :flat
  validates :phone_number, presence: true
  validates :description, presence: true
end
