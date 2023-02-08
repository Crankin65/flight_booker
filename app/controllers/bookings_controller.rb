class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passenger_count]
  end
end
