require 'test_helper'

class AdoptionTest < ActiveSupport::TestCase

  test "should save adoption with valid data" do
    adoption = Adoption.new
    adoption.customer_id = 1
    adoption.pet_id = 1
    assert adoption.save
  end

  test "should save adoption even if a customer has adopted another already" do
    adoption = Adoption.new
    adoption.customer_id = 1
    adoption.pet_id = 2
    assert adoption.save
  end

  test "should not save adoption if a pet is adopted already" do
    adoption = Adoption.new
    adoption.customer_id = 2
    adoption.pet_id = 3
    assert_not adoption.save
  end

end
