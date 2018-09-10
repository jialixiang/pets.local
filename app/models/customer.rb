class Customer < ApplicationRecord
  validates :id, numericality: { only_integer: true, greater_than: 0 }

  has_one :preference, class_name: "CustomerPreference", dependent: :destroy
  has_many :adoptions
  has_many :pets, through: :adoptions

  accepts_nested_attributes_for :preference, allow_destroy: true
end
