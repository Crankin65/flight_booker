class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    @airports = Airport.all

    @departure_airport_options = Flight.all.map do  |f|
      [f.departure_airport.name]
    end

    @arrival_airport_options = Flight.all.map do  |f|
      [f.arrival_airport.name]
    end

    @passengers = [1,2,3,4]
    @departure_date = Flight.all.map do |f|
      f.flight_time.to_date
    end
  end

  private
    # def airport_flight_params
    #   params.require(:airport).permit(:)
    #
    # end
end
