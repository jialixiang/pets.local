class CustomerPreference < ApplicationRecord
  belongs_to :customer, dependent: :destroy
end
