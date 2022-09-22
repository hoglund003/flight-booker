class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end
end
