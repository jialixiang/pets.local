json.extract! customer_preference, :id, :age, :species, :breed, :created_at, :updated_at
json.url customer_preference_url(customer_preference, format: :json)
