class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map {|airport| [airport.airport_code, airport.id]}
    @passengers = (1..4).map {|n| [n, n]}
    @dates = @flights.order(:departure_time).map{|flight| [Time.at(flight.departure_time).strftime('%d.%m.%Y'), Time.at(flight.departure_time).midnight.to_i]}.uniq

    @results =  Flight.all
  end
end
