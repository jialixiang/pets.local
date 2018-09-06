class Pet < ApplicationRecord
  validates :id, numericality: { only_integer: true, greater_than: 0 }
  validates :name, length: { maximum: 70 }
  validates_datetime :available_from, allow_nil: true
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100}, allow_nil: true
  enum species: [ :cat, :dog, :rabbit ]
  enum breed: [ :labrador, :poodle, :spaniel, :terrier ]

  validate :validate_breed_association
  def validate_breed_association
    if species != "dog" && breed
        errors.add(:breed, :invalid)
    end
  end
end
