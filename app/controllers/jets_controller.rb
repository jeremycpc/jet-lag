class JetsController < ApplicationController
  def index
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

  private
  def jet_params
    params.require(:jet).permit(:name, :description, :has_service, :origin, :price)
  end
end
