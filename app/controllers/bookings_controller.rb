class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
