class JetsController < ApplicationController
  def index
    @jets = Jet.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
