class Airport < ApplicationRecord
    has_many :arriving_flights, class_name: "Flight", foreign_key: "destination_id", dependent: :destroy, inverse_of: :destination_airport    
    has_many :departing_flights, class_name: "Flight", foreign_key: "origin_id", dependent: :destroy, inverse_of: :origin_airport

    def details
        depart_time = humanize_departure
        arrive_time = humanize_arrival
        "#{depart_time} departure from #{origin_airport.code} and arrive at #{arrive_time} to #{destination_airport.code}"
      end
    
      def humanize_departure
        departure_time.strftime('%l:%M %p')
      end
    
      def humanize_arrival
        (departure_time + (duration.to_f / 60).hours).strftime('%l:%M %p')
      end
    
      def humanize_date
        departure_date.strftime("%B %d, %Y")
      end
end
