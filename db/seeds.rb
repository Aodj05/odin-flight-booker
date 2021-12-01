# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.define do
  factory :airport do
    code { "TOP" }
    location { "Springfield, US" }

    trait :new_york_city do
      code { "NYC" }
    end

    trait :san_francisco do
      code { "SFO" }
    end

    trait :los_angeles do
      code { "LAX" }
    end

    trait :atlanta do
      code { "ATL" }
    end

    trait :orlando do
      code { "MCO" }
    end
  end
end

Airport.find_or_create_by(code: "SFO", location: "San Francisco, CA")
Airport.find_or_create_by(code: "NYC", location: "New York City, NY")
Airport.find_or_create_by(code: "MCO", location: "Orlando, FL")
Airport.find_or_create_by(code: "LAX", location: "Los Angeles, CA")
Airport.find_or_create_by(code: "ATL", location: "Atlanta, GA")



class FlightGenerator
  def initialize(date)
    @date = date
  end

  def call
    airport_pairs = find_airport_pairs
    airport_pairs.each do |airport_pair|
      find_or_create_flights(airport_pair)
    end
  end

  private

  def find_or_create_flights(airport_pair)
    origin = Airport.find_by(code: airport_pair[0])
    destination = Airport.find_by(code: airport_pair[1])
    flights = Flight.where(origin_airport: origin, destination_airport: destination, departure_date: @date)
    return if flights.count.positive?

   # flight_duration = find_flight_duration(airport_pair)
    create_flights(origin, destination, flight_duration)
  end

  def create_flights(origin, destination, flight_duration)
    Flight.create(origin_airport: origin, destination_airport: destination, departure_date: @date)
  end

  def flight_duration
    {
      SFO: { NYC: 308, ATL: 257, LAX: 53, MCO: 292 },
      NYC: { SFO: 308, ATL: 101, LAX: 296, MCO: 122 },
      ATL: { SFO: 257, NYC: 101, LAX: 236, MCO: 61 },
      LAX: { SFO: 53, NYC: 296, ATL: 236, MCO: 266, },
      MCO: { SFO: 292, NYC: 122, ATL: 61, LAX: 266 }
    }
  end

 

  #def find_flight_duration(airports)
    #flight_duration[airports(0).to_sym][airports(1).to_sym]
  #end

  def find_airport_pairs
    flight_duration.map(&:to_s).permutation(2)
  end
end

start = Time.zone.today
finish = Time.zone.today + 31.days

(start..finish).each do |date|
  flight_generator = FlightGenerator.new(date)
  flight_generator.call
end 

