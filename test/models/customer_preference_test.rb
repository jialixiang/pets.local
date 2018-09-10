require 'test_helper'

class CustomerPreferenceTest < ActiveSupport::TestCase

  test "should save customer preference with valid data" do
    preference = CustomerPreference.new
    preference.customer_id = 1
    assert preference.save
  end

  test "should not save customer preference with customer" do
    preference = CustomerPreference.new
    assert_not preference.save
  end

  test "should not save customer preference with invalid age range" do
    preference = CustomerPreference.new
    assert_raises ArgumentError do
      preference.age = 'fake'
    end
  end

  test "should not save customer preference with invalid species" do
    preference = CustomerPreference.new
    preference.species = ['fake']
    assert_not preference.save
  end

  test "should not save customer preference with invalid breed" do
    preference = CustomerPreference.new
    preference.species = ['cat']
    preference.species = ['labrador']
    assert_not preference.save
  end

end
