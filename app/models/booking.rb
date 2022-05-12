require 'pry'
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates  :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :start_date_cannot_be_after_end_date
  validates :start_date, uniqueness: { scope: :bike_id,
                                       message: "Sorry this bike has already been booked on this date" }
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def start_date_cannot_be_after_end_date
    if start_date.present? && start_date > end_date
      errors.add(:start_date, "End date must be after start date")
    end
  end
end
