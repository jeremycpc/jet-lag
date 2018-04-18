class SearchAirportsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    airport_origin_id = params[:airport_origin]
    airport_destination_id = params[:airport_destination]
    @jets = Jet.where(airport_origin_id: airport_origin_id, airport_destination_id: airport_destination_id)

    @markers = @jets.map do |jet|
      {
        lat: jet.airport_origin.lat,
        lng: jet.airport_origin.lon
      }
    end
  end
end
