class JetsController < ApplicationController
  def index
    @jets = Jet.all
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
