class CustomerPreference < ApplicationRecord
  enum age: {
    "less than 2 years": "<2",
    "2 to 4 years": "2-4",
    "more than 4 years": ">4"
  }
  belongs_to :customer
  validates :customer, presence: true

  validate :validate_species_types
  validate :validate_breed_types
  validate :validate_breed_association

  def validate_species_types
    if !species.is_a?(Array) || species.detect { |s| !(%w(cat dog rabbit).include? s) }
      errors.add(:species, :invalid)
    end
  end

  def validate_breed_types
    if !breed.is_a?(Array) || breed.detect { |s| !(%w(labrador poodle spaniel terrier).include? s) }
      errors.add(:breed, :invalid)
    end
  end

  def validate_breed_association
    if !species.include?("dog") && breed.any?
      errors.add(:breed, :invalid)
    end
  end
end
