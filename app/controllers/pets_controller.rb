class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /pets/1/matches
  # GET /pets/1/matches.json
  def matches
    @pet = Pet.find(params[:id])
    customer_preferences = CustomerPreference.where(
      "'#{@pet.species}' = ANY (species)"
    )

    matched_customers = []
    customer_preferences.each do |preference|
      next if (preference.breed.any? && preference.breed.exclude?(@pet.breed))
      next if (preference.age && !@pet.age)
      next if (preference.age == 'less than 2 years' && @pet.age >= 2)
      next if (preference.age == '2 to 4 years' && (@pet.age < 2 || @pet.age > 4))
      next if (preference.age == 'more than 4 years' && @pet.age <= 4)
      matched_customers.push(preference.customer_id)
    end
    respond_to do |format|
      format.html { render :matches, notice: 'Pet was successfully destroyed.' }
      format.json { render json: matched_customers, status: :ok, location: @pet }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:id, :name, :available_from, :age, :species, :breed)
    end
end
