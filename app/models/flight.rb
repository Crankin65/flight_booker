class Flight < ApplicationRecord
  validates :departure_airport, :arrival_airport, :flight_time, :flight_duration, presence: true

  belongs_to :departure_airport, foreign_key: "airport_id", class_name: "Airport", primary_key: :id
  belongs_to :arrival_airport, foreign_key: "airport_id", class_name: "Airport", primary_key: :id
end
