Airport.destroy_all
Flight.destroy_all
Booking.destroy_all
Passenger.destroy_all

Airport.create!([{name: "LGA"},{name: "JFK"}, {name: "EWR"}])
Flight.create!([{flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 5, departure_airport_id: Airport.where(name:"EWR").take.id, arrival_airport_id: Airport.where(name: "JFK").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 7, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"JFK").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"EWR").take.id, arrival_airport_id: Airport.where(name: "LGA").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "JFK").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 3, departure_airport_id: Airport.where(name:"JFK").take.id, arrival_airport_id: Airport.where(name: "LGA").take.id} ])

booking = Booking.create!([{flight_id: Flight.where(flight_duration: 5).take.id}])
Passenger.create!([{first_name: "Bob", last_name: "Tom", booking_id: booking.id}])

p "Created #{Airport.count} airports,  #{Flight.count} flights(s), #{Booking.count} booking(s), and #{Passenger.count} passenger(s)"

# if Airport.error?
#   p "The Airport errors are #{Airport.errors.full_messages}"
# end
#
# if Flight.error?
#   p "The Flight errors are #{Flight.errors.full_messages}"
# end