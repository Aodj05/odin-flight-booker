class Booking < ApplicationRecord
    has_many :passengers, dependent: :destroy
    has_many :seats, dependent: :destroy
    has_many :flights, through: :seats

    accepts_nested_attributes_for :passengers
end
