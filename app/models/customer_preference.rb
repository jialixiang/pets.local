class CustomerPreference < ApplicationRecord
  enum age: [ :'less than 2 years', :'2 to 4 years', :'more than 4 years']
  belongs_to :customer, dependent: :destroy
end
