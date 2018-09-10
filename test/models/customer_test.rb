require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should save customer" do
    customer = Customer.new
    assert customer.save
  end
end
