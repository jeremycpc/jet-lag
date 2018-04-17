class Airport < ApplicationRecord
  has_many :jets

  validates :name, presence: true
  validates :acronym, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
