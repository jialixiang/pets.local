class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @allowed_age_range = ['less than 2 years', '2 to 4 years', 'more than 4 years']
    @allowed_species = ['cat', 'dog', 'rabbit']
    @allowed_breed = ['labrador', 'poodle', 'spaniel', 'terrier']
  end

  # GET /customers/1/edit
  def edit
    @allowed_age_range = ['less than 2 years', '2 to 4 years', 'more than 4 years']
    @allowed_species = ['cat', 'dog', 'rabbit']
    @allowed_breed = ['labrador', 'poodle', 'spaniel', 'terrier']
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /customers/1/matches
  # GET /customers/1/matches.json
  def matches
    @customer = Customer.find(params[:id])
    @preference = @customer.preference

    @matched_pets = []
    Pet.all.each do |pet|
      next if (pet.adoption)
      next if (@preference.species.any? && @preference.species.exclude?(pet.species))
      next if (@preference.breed.any? && pet.species == 'dog' && @preference.breed.exclude?(pet.breed))
      next if (@preference.age && !pet.age)
      next if (@preference.age == 'less than 2 years' && pet.age >= 2)
      next if (@preference.age == '2 to 4 years' && (pet.age < 2 || pet.age > 4))
      next if (@preference.age == 'more than 4 years' && pet.age <= 4)
      @matched_pets.push(pet.id)
    end
    respond_to do |format|
      format.html { render :matches, notice: 'Found matched pets.' }
      format.json { render json: @matched_pets, status: :ok, location: @customer }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:id, preference_attributes: [:id, :age, :species => [], :breed => []])
    end
end
