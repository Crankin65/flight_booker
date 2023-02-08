class AddFlightsToPassengers < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :passenger
  end
end
