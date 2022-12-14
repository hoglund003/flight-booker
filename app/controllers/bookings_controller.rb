class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:selected_flight])
    @booking = Booking.new
    params[:number_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).confirmation_mail.deliver_later
      end
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [
      :id, :name, :email
    ])
  end
end
