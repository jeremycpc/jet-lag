class JetsController < ApplicationController
  before_action :find_jet, only: [:show, :edit, :update, :destroy]
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
    params.require(:jet).permit(:name, :description, :has_service, :origin, :price)
  end

  def find_jet
    @jet = Jet.find(params[:id])
  end
end
