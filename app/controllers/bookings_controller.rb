class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.new
    authorize = @booking
  end

  def edit
    authorize @booking
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    @booking.user_id = current_user[:id]
    @booking.booking_price = calculate_price(@jet, @booking)
    authorize @booking
    if @booking.save!
      redirect_to bookings_path
    else
      render 'jets/show'
    end
  end

  def update
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.update!(booking_params)
    redirect_to bookings_path
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  def calculate_price(jet, booking)
    price = jet.price + ((booking.returned_on - booking.booked_on).floor) * 1000
    final_price = price + (calculate_distance([jet.airport_origin.lat.to_f,jet.airport_origin.lon.to_f],
      [jet.airport_destination.lat.to_f,jet.airport_destination.lon.to_f]))* 1.2

    return final_price
  end

  def calculate_distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    return (rm * c)/1000 # Delta in meters
  end

private

  def booking_params
    params.require(:booking).permit(:booked_on, :returned_on, :id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
