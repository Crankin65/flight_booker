# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all

Airport.create!([{name: "LGA"},{name: "JFK"}, {name: "EWR"}])
Flight.create!([{flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 5, departure_airport_id: Airport.where(name:"EWR").take.id, arrival_airport_id: Airport.where(name: "JFK").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 7, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"JFK").take.id, arrival_airport_id: Airport.where(name: "EWR").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"EWR").take.id, arrival_airport_id: Airport.where(name: "LGA").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 4, departure_airport_id: Airport.where(name:"LGA").take.id, arrival_airport_id: Airport.where(name: "JFK").take.id},
                {flight_time: DateTime.new(2022,1,2,3,4,5), flight_duration: 3, departure_airport_id: Airport.where(name:"JFK").take.id, arrival_airport_id: Airport.where(name: "LGA").take.id} ])

p "Created #{Airport.count} airports and #{Flight.count} flights(s)"

# if Airport.error?
#   p "The Airport errors are #{Airport.errors.full_messages}"
# end
#
# if Flight.error?
#   p "The Flight errors are #{Flight.errors.full_messages}"
# end