# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.find_or_create_by(code: "SFO", location: "San Francisco, CA")
Airport.find_or_create_by(code: "NYC", location: "New York City, NY")
Airport.find_or_create_by(code: "MCO", location: "Orlando, FL")
Airport.find_or_create_by(code: "LAX", location: "Los Angeles, CA")
Airport.find_or_create_by(code: "ATL", location: "Atlanta, GA")

Flight.find_or_create_by(origin_id: 5, destination_id: 1, departure_date: @date , departure_time: @time)
Flight.find_or_create_by(origin_id: 2, destination_id: 5, departure_date: @date , departure_time: @time)
Flight.find_or_create_by(origin_id: 3, destination_id: 4, departure_date: @date , departure_time: @time)
Flight.find_or_create_by(origin_id: 4, destination_id: 2, departure_date: @date , departure_time: @time)
Flight.find_or_create_by(origin_id: 1, destination_id: 3, departure_date: @date , departure_time: @time)