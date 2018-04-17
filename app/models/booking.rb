class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :jet

  validates :booked_on, presence: true
  validates :returned_on, presence: true

end
