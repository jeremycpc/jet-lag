class Jet < ApplicationRecord
  belongs_to :user
  belongs_to :airport_origin, class_name: "Airport"
  belongs_to :airport_destination, class_name: "Airport"

  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
