json.extract! pet, :id, :id, :name, :available_from, :age, :species, :breed, :created_at, :updated_at
json.url pet_url(pet, format: :json)
json.url matches_url(pet, format: :json)
