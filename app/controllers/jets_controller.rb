class JetsController < ApplicationController
  before_action :find_jet, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @jets = policy_scope(Jet)
  end

  def new
    @jet = Jet.new
    authorize @jet
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    authorize @jet
    if @jet.save
      redirect_to jet_path(@jet)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @jet_owner = @jet.user
    authorize @jet
  end

  def edit
    authorize @jet
  end

  def update
    authorize @jet
    @jet.update(jet_params)
    redirect_to jet_path(@jet)
  end

  def destroy
    authorize @jet
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
