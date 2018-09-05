require "application_system_test_case"

class CustomerPreferencesTest < ApplicationSystemTestCase
  setup do
    @customer_preference = customer_preferences(:one)
  end

  test "visiting the index" do
    visit customer_preferences_url
    assert_selector "h1", text: "Customer Preferences"
  end

  test "creating a Customer preference" do
    visit customer_preferences_url
    click_on "New Customer Preference"

    fill_in "Age", with: @customer_preference.age
    fill_in "Breed", with: @customer_preference.breed
    fill_in "Species", with: @customer_preference.species
    click_on "Create Customer preference"

    assert_text "Customer preference was successfully created"
    click_on "Back"
  end

  test "updating a Customer preference" do
    visit customer_preferences_url
    click_on "Edit", match: :first

    fill_in "Age", with: @customer_preference.age
    fill_in "Breed", with: @customer_preference.breed
    fill_in "Species", with: @customer_preference.species
    click_on "Update Customer preference"

    assert_text "Customer preference was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer preference" do
    visit customer_preferences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer preference was successfully destroyed"
  end
end
