require "application_system_test_case"

class SupportProcessRecordsTest < ApplicationSystemTestCase
  setup do
    @support_process_record = support_process_records(:one)
  end

  test "visiting the index" do
    visit support_process_records_url
    assert_selector "h1", text: "Support Process Records"
  end

  test "creating a Support process record" do
    visit support_process_records_url
    click_on "New Support Process Record"

    fill_in "Contents", with: @support_process_record.contents
    fill_in "Name", with: @support_process_record.name
    fill_in "Title", with: @support_process_record.title
    click_on "Create Support process record"

    assert_text "Support process record was successfully created"
    click_on "Back"
  end

  test "updating a Support process record" do
    visit support_process_records_url
    click_on "Edit", match: :first

    fill_in "Contents", with: @support_process_record.contents
    fill_in "Name", with: @support_process_record.name
    fill_in "Title", with: @support_process_record.title
    click_on "Update Support process record"

    assert_text "Support process record was successfully updated"
    click_on "Back"
  end

  test "destroying a Support process record" do
    visit support_process_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Support process record was successfully destroyed"
  end
end
