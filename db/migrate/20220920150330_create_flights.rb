class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id

      t.integer :departure_time
      t.integer :flight_duration      

      t.timestamps
    end
  end
end
