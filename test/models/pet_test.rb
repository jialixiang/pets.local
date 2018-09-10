require 'test_helper'

class PetTest < ActiveSupport::TestCase

  test "should save pet with valid data" do
    pet = Pet.new
    pet.id = 100
    pet.name = 'darren'
    pet.available_from = '2018-09-03 00:00:00'
    pet.age = 2
    pet.species = 'dog'
    pet.breed = 'labrador'
    assert pet.save
  end

  test "should not save pet with an invalid timestamp" do
    pet = Pet.new
    pet.available_from = 'fake'
    assert_not pet.save
  end

  test "should not save pet with an invalid age" do
    pet = Pet.new
    pet.age = -1
    assert_not pet.save
  end

  test "should not save pet with an invalid species" do
    pet = Pet.new
    assert_raises ArgumentError do
      pet.species = 'fake'
    end
  end

  test "should not save pet with an invalid breed" do
    pet = Pet.new
    assert_raises ArgumentError do
      pet.breed = 'fake'
    end
  end

end
