class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count]
    @passenger_count.to_i.times { @booking.passengers.build }

  end

  def create
    @passenger = Passenger.new(booking_params[:passengers])
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      flash[:notice] = "Passenger save was successsful"
      redirect_to booking_path(@booking)

      PassengerMailer.with(booking: @booking).booking_confirmation_email.deliver_later

    else
      flash[:alert] = "Passenger not saved"
    end

  end

  def show
    # @flight = Flight.find(params[:id])
    # @booking = @flight.bookings.last
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
    @flight = @booking.flight
    @departing_flight = @booking.flight.departure_airport.name
    @arriving_flight = @booking.flight.arrival_airport.name



  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email])
  end

end
