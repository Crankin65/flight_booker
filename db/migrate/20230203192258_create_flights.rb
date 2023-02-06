class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :flight_time
      t.float :flight_duration
      t.timestamps
    end
  end
end
