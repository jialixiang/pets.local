class Adoption < ApplicationRecord
  belongs_to :customer
  belongs_to :pet

  validates :customer, presence: true
  validates :pet, presence: true
  validates_uniqueness_of :pet
end
