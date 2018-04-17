class Jet < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
