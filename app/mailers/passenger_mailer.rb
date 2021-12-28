class PassengerMailer < ApplicationMailer
    default from: 'confirmation@OdinFlightBooker.com'

    def confirmation_email
        @user = params[:user]
        @booking = params[:booking]
        mail to: @booking.passengers.pluck(:email), subject: "Odin Flight Booker Confirmation"
    end
end
