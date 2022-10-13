class PassengerMailer < ApplicationMailer 

  def confirmation_mail
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: "Flight confirmation")
  end
end
