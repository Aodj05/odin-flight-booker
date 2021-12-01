class BookingsController < ApplicationController

    def new
        @booking = Booking.new
        @flights = find_flights(params[:booking_option])
        passenger_count = params[:passenger_count].to_i
        passenger_count.times { @booking.passengers.build }
    end

    def create
        @booking = Bookingsnew(passenger_params)
        @flights = find_flights(params[:booking][:booking_option])
        create_booking_seats(@flights, params[:booking][:passenger_count].to_i)

        if @booking.save
            flash[:notice] = "Confirmation email sent"
            redirect_to @booking
        else
            render :new
        end
    end

    def show
        @booking = Booking.find_by(id: params[:id])
        return if @booking
                flash[:alert] = "Booking does not exist"
                redirect_to root_url
            end
    end
        
    private

    def passenger_params
        params.require(:booking).permit(passengers_attributes: %i[name email])
    end

    def find_flights(booking_options)
        flight_numbers = booking_option.split
        flight_numbers.collect { |num| Flight.find_by(id: num) }
    end

    def create_booking_seats
        passenger_count.times do
            flights.each { |flight| @booking.seats.buil(flight: flight) }
        end
    end
end
