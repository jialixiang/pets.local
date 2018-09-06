# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pet_list = [
  [1, "darren", "2018-09-03 00:00:00", 2, "dog", "terrier"],
  [2, "oreo", "2018-08-30 12:00:00", 1, "dog", "labrador"],
  [3, "coco", "2018-08-20 08:00:00", nil, "cat", nil],
  [4, "daisy", nil, 5, "rabbit", nil],
  [5, "lola", "2018-09-01 15:00:00", 1, "other", nil],
  [6, "bella", nil, 0, "cat", "poodle"]
]

customer_list = [
  [1, ["less than 2 years", ["dog"], []]],
  [2, ["2 to 4 years", ["cat"], []]],
  [3, ["more than 4 years", ["dog", "rabbit"], ["labrador", "poodle"]]],
  [4, [nil, [], []]],
  [5, ["other", ["rabbit"], []]],
  [6, [nil, ["rabbit", "fake"], []]],
  [7, ["2 to 4 years", ["dog"], ["fake"]]],
  [8, [nil, ["rabbit"], ["spaniel"]]]
]

# Create testing pets
Pet.delete_all
pet_list.each do |id, name, available_from, age, species, breed|
  begin
    Pet.create!(
      id: id,
      name: name,
      available_from: available_from,
      age: age,
      species: species,
      breed: breed
    )
  rescue ArgumentError, ActiveRecord::RecordInvalid => e
    puts "Creating Pet Error: #{e}"
  end
end

# Create testing customers
Customer.delete_all
customer_list.each do |id, preference|
  begin
    customer = Customer.create!(
      id: id
    )
    customer.create_preference!(
      age: preference[0],
      species: preference[1],
      breed: preference[2]
    )
  rescue ArgumentError, ActiveRecord::RecordInvalid => e
    puts "Creating Customer Error: #{e}"
  end
end
