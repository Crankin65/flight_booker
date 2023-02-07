class Airport < ApplicationRecord
  validates :name, presence: true

  before_destroy :destroy_flights

  has_many :departing_flights, foreign_key: "departure_airport_id", class_name: 'Flight'
  has_many :arriving_flights, foreign_key: "arrival_airport_id", class_name: 'Flight'

  accepts_nested_attributes_for :departing_flights
  accepts_nested_attributes_for :arriving_flights

  private

  def destroy_flights
    self.departing_flights.destroy_all
    self.arriving_flights.destroy_all
  end
end
