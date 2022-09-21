class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map {|airport| [airport.airport_code, airport.id]}
    @passengers = (1..4).map {|n| [n, n]}
    @dates = @flights.order(:departure_time).map{|flight| [Time.at(flight.departure_time).strftime('%d.%m.%Y'), Time.at(flight.departure_time).midnight.to_i]}.uniq

    @results = Flight.where(search_params)
  end

  private

  def search_params
    {
      departure_time: (params[:departure_time].to_i)..(params[:departure_time].to_i + 1.days.to_i), 
      departure_airport_id: params[:departure_airport_id], 
      arrival_airport_id: params[:arrival_airport_id]
    }
  end
end
