require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should save customer" do
    customer = Customer.new
    customer.id = 100
    assert customer.save
  end
end
