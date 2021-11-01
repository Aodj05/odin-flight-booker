class Airport < ApplicationRecord
    has_many :arriving_flights, class_name: "Flight", foreign_key: "destination_id", dependent: :destroy, inverse_of: :destination_airport    
    has_many :departing_flights, class_name: "Flight", foreign_key: "origin_id", dependent: :destroy, inverse_of: :origin_airport
end
