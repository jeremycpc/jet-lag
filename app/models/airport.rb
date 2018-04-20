class Airport < ApplicationRecord
  has_many :jets

  validates :name, presence: true
  validates :acronym, presence: true
  validates :lat, presence: true
  validates :lon, presence: true

  default_scope { order(:acronym) }

  def code_name
    [acronym, name].join(" - ")
  end
end

