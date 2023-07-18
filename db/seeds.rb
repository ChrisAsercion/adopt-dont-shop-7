# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PetApplication.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

@shelter1 = Shelter.create!(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
@shelter2 = Shelter.create!(name: "Pets Galore", city: "Sacramento CA", foster_program: false, rank: 10)
@shelter3 = Shelter.create!(name: "Dog Pound", city: "San Francisco CA", foster_program: false, rank: 11)
@shelter4 = Shelter.create!(name: "Cat Pound", city: "Culver CA", foster_program: false, rank: 12)

@pet1 = Pet.create!(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: @shelter1.id)
@pet2 = Pet.create!(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: @shelter1.id)
@pet3 = Pet.create!(name: "Scoobydoo", age: 3, breed: "Great Dane", adoptable: true, shelter_id: @shelter2.id)
@pet4 = Pet.create!(name: "Mr. Scooby", age: 4, breed: "Great Dane", adoptable: true, shelter_id: @shelter3.id)

@application1 = Application.create!(name: "Topher C.", street_address: "123 sesame st.",  city:  "New York", state: "NY", zip: "10001", description: "I have a nice home", petscription: "", status: "In progress")
@application2 = Application.create!(name: "Topher B.", street_address: "101 W. East St.", city: "Los Angeles", state: "CA", zip: "90210", description: "I have home", petscription: "", status: "In Progress")

#Join table
@application1.pets << @pet1
@application1.pets << @pet2
@application2.pets << @pet2