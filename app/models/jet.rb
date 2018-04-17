class Jet < ApplicationRecord

  belongs_to :user
  belongs_to :airport_origin, class_name: "Airport"
  belongs_to :airport_destination, class_name: "Airport"

  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  def seat_range
    (1..max_capacity)
  end

  def calculate_price
    price = self.price + ((self.end_on - self.start_on).floor) * 1000
    final_price = price + (calculate_distance([self.airport_origin.lat.to_f,self.airport_origin.lon.to_f],
      [self.airport_destination.lat.to_f,self.airport_destination.lon.to_f])) * 1.2

    return final_price
  end

  def calculate_distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    return (rm * c)/1000 # Delta in meters
  end

end
