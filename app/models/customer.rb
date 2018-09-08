class Customer < ApplicationRecord
  has_one :preference, class_name: "CustomerPreference", dependent: :destroy
  accepts_nested_attributes_for :preference, allow_destroy: true
end
