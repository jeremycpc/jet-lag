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

private

  def booking_params
    params.require(:booking).permit(:booked_on, :returned_on, :id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
