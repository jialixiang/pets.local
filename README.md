# pets.local

pets.local provides a soft real-time, location-based matching service for Customers who are looking to find a new Pet.

### Tech Stack
* Ruby on Rails
* PostgreSQL
* Vue.js
* Docker
* Circle CI

### Entity Associations
<img width="403" alt="entities" src="https://user-images.githubusercontent.com/4859095/45280836-81644c80-b508-11e8-92af-5c3be9d79bd4.png">

### API
* POST /pets
<br />Add a new pet to the system, with all the properties described above

* GET /pets/{id}
<br />Fetch the pet by ID

* GET /pets/{id}/matches
<br />Get an array of "matching" customers for the given pet

* POST /customers
<br />Add a new customer to the system (Together with their preferences for pets)

* GET /customers/{id}
<br />Fetch the customer by ID

* GET /customers/{id}/matches
<br />Get an array of "matching" Pets for the given customer

* POST /customers/{id}/adopt?pet_id={pet_id}
<br />The Customer adopts the given Pet (The Pet and Customer should no longer appear in /matches queries)

### Build the Project
```
docker-compose run web rails new . --force --database=postgresql --webpack=vue --skip-coffee
docker-compose run web yarn install
docker-compose build
docker-compose up
```

### Local Testing
```
rake db:create
rake db:migrate
rake db:seed

rake test

rails server
```

### TODOs
* Real-Time
* Location
