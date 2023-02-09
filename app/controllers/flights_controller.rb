class FlightsController < ApplicationController
  def index
    @departure_airport_options = Airport.all.map {|a| [a.name, a.id]}
    @arrival_airport_options = Airport.all.map {|a| [a.name, a.id] }
    @passengers = [1,2,3,4]
    @departure_date =  Flight.all.map {|f| [f.flight_time.to_date, f.flight_time]}.uniq

    if flight_params
      #This should be better
     @searched_flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                                        arrival_airport_id: params[:arrival_airport_id],
                                        flight_time: params[:departure_date])
    end


  end

  private
    def flight_params
      params.permit(:departure_airport_id, :arrival_airport_id, :passenger_count, :departure_date, :commit)
    end


end
