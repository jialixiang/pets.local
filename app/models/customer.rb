class Customer < ApplicationRecord
  has_one :preference, class_name: "CustomerPreference"
end
