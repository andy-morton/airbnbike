class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :name, :location, :size, :category, :price, presence: true
  validates :name, uniqueness: { scope: :user,
                                 message: "All your bikes should have a unique name" }
  validates :description, length: { minimum: 10,
                                    message: "Please add more detail to your bike description" }
end
