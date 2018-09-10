require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:oreo)
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_url
    assert_response :success
  end

  test "should create pet" do
    assert_raises ActiveRecord::RecordNotUnique do
      post pets_url, params: {
        pet: {
          id: @pet.id,
          name: @pet.name,
          available_from: @pet.available_from,
          age: @pet.age,
          species: @pet.species,
          breed: @pet.breed
        }
      }
    end
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_url(@pet)
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: {
      pet: {
        id: @pet.id,
        name: @pet.name,
        available_from: @pet.available_from,
        age: @pet.age,
        species: @pet.species,
        breed: @pet.breed
      }
    }
    assert_redirected_to pet_url(@pet)
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet)
    end

    assert_redirected_to pets_url
  end
end
