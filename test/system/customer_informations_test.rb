require "application_system_test_case"

class CustomerInformationsTest < ApplicationSystemTestCase
  setup do
    @customer_information = customer_informations(:one)
  end

  test "visiting the index" do
    visit customer_informations_url
    assert_selector "h1", text: "Customer Informations"
  end

  test "creating a Customer information" do
    visit customer_informations_url
    click_on "New Customer Information"

    fill_in "Body", with: @customer_information.body
    fill_in "Title", with: @customer_information.title
    click_on "Create Customer information"

    assert_text "Customer information was successfully created"
    click_on "Back"
  end

  test "updating a Customer information" do
    visit customer_informations_url
    click_on "Edit", match: :first

    fill_in "Body", with: @customer_information.body
    fill_in "Title", with: @customer_information.title
    click_on "Update Customer information"

    assert_text "Customer information was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer information" do
    visit customer_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer information was successfully destroyed"
  end
end
