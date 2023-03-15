class PassengerMailer < ApplicationMailer
  include BookingsHelper

  default from: 'notifications@flight-booking.com'
          # ,to: -> {@passengers.pluck(:email) }

  def booking_confirmation_email
    @booking = params[:booking]
    @departing_airport = @booking.flight.departure_airport.name
    @arriving_airport = @booking.flight.arrival_airport.name
    @departure_time = formatted_date(@booking.flight.flight_time)
    @passengers = @booking.passengers
    @url = 'http://flights-notification.com'
    mail(to: @passengers.first.email, subject: "Successful Booking")
  end
end
