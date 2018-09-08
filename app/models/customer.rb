class Customer < ApplicationRecord
  has_one :preference, class_name: "CustomerPreference", dependent: :destroy
  has_many :adoptions
	has_many :pets, through: :adoptions

  accepts_nested_attributes_for :preference, allow_destroy: true
end
