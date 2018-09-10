require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:alice)
    @preference = customer_preferences(:alice)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_raises ActiveRecord::RecordNotUnique do
      post customers_url, params: {
        customer: {
          id: @customer.id,
          preference_attributes: {
            id: nil,
            age: @preference.age,
            species: @preference.species,
            breed: @preference.breed
          }
        }
      }
    end
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: {
      customer: {
        id: @customer.id,
        preference_attributes: {
          id: @preference.id,
          age: @preference.age,
          species: @preference.species,
          breed: @preference.breed
        }
      }
    }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end

  test "should get matching pets" do
    get "/customers/#{@customer.id}/matches.json"
    assert_equal JSON.parse(response.body), []
  end

  test "should be able to adopt a pet" do
    post "/customers/#{@customer.id}/adopt?pet_id=1"
    assert_redirected_to customer_url(@customer)
  end

  test "should not be able to adopt a pet which is adopted already" do
    post "/customers/#{@customer.id}/adopt.json?pet_id=3"
    assert_equal JSON.parse(response.body), {"pet"=>["has already been taken"]}
  end
end
