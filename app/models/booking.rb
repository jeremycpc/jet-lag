class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :jet

  validates :seats, presence: true
end
