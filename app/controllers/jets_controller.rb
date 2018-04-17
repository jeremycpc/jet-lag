class JetsController < ApplicationController
  before_action :find_jet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @jets = Jet.all
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    if @jet.save
      redirect_to jet_path(@jet)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @jet_owner = @jet.user
  end

  def edit
  end

  def update
    @jet.update(jet_params)
    redirect_to jet_path(@jet)
  end

  def destroy
    @jet.destroy
    redirect_to jets_path
  end

  private
  def jet_params
    params.require(:jet).permit(:name, :description, :has_service, :origin, :price, :photo)
  end

  def find_jet
    @jet = Jet.find(params[:id])
  end
end
