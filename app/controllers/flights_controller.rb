class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map {|airport| [airport.airport_code, airport.id]}
    @passengers = (1..4).map {|n| [n, n]}
    dates = @flights.order(:departure_time).map {|flight| flight.departure_time.strftime('%m.%d.%Y')}
    @dates = dates.uniq
  end
end
