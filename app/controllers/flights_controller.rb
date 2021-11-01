class FlightsController < ApplicationController
    def index
        @airport_options = Airport.all.map { |u| [u.location, u.id] }
        return if search_params.empty?
    end

    private
    
    def search_params
        params.permit(:origin_id, :destination_id, :departure_date)
    end
end
