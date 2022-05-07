class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :location, presence: true
  validates :name, uniqueness: { scope: :user,
                                 message: "All your bikes should have a unique name" }
  validates :price, presence: true
  validates :description, length: { minimum: 20,
                                    message: "Please add more detail to your bike description" }
end
