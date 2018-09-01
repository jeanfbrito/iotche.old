require "application_system_test_case"

class ReadingsTest < ApplicationSystemTestCase
  setup do
    @reading = readings(:one)
  end

  test "visiting the index" do
    visit readings_url
    assert_selector "h1", text: "Readings"
  end

  test "creating a Reading" do
    visit readings_url
    click_on "New Reading"

    fill_in "Data", with: @reading.data
    fill_in "Datetime", with: @reading.datetime
    fill_in "Device", with: @reading.device_id
    fill_in "Device Uid", with: @reading.device_uid
    click_on "Create Reading"

    assert_text "Reading was successfully created"
    click_on "Back"
  end

  test "updating a Reading" do
    visit readings_url
    click_on "Edit", match: :first

    fill_in "Data", with: @reading.data
    fill_in "Datetime", with: @reading.datetime
    fill_in "Device", with: @reading.device_id
    fill_in "Device Uid", with: @reading.device_uid
    click_on "Update Reading"

    assert_text "Reading was successfully updated"
    click_on "Back"
  end

  test "destroying a Reading" do
    visit readings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reading was successfully destroyed"
  end
end
