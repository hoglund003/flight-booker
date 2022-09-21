class Airport < ApplicationRecord
  validates :airport_code, uniqueness: true, presence: true

  has_many :departing_flights, foreign_key: "departure_airport_id", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "arrival_airport_id", class_name: "Flight"

  # has_many :departing_flights
end
