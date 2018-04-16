class JetsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @booking = Booking.new
    @jet = Jet.find(params[:id])
  end

  def edit
  end
end
