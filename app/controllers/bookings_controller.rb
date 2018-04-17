class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
    authorize = @booking
  end

  def edit
    authorize @booking
    @jet = @booking.jet
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    @booking.user_id = current_user[:id]
    @booking.booking_price = @jet.calculate_price * @booking.seats
    authorize @booking
    if @booking.save!
      redirect_to bookings_path
    else
      render 'jets/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @jet = @booking.jet
    authorize @booking
    # @booking.booking_price = @jet.calculate_price * @booking.seats
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
    params.require(:booking).permit(:seats)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
