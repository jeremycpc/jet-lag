class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :booked_jets, through: :bookings, source: :jet
  has_many :owned_jets, dependent: :destroy, class_name: 'Jet'
end
