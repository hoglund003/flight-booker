class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [
      :id, :name, :email
    ])
  end
end
