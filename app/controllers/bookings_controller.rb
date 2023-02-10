class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @passenger = Passenger.new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count]
  end

  def create

  end

  private

  def booking_params
    params.permit(:departure_airport_id, :arrival_airport_id,
                  :passenger_count, :departure_date, :flight_id, :commit)
  end

  def create_booking_params
  end
end
