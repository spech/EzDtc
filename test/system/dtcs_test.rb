require "application_system_test_case"

class DtcsTest < ApplicationSystemTestCase
  setup do
    @dtc = dtcs(:one)
  end

  test "visiting the index" do
    visit dtcs_url
    assert_selector "h1", text: "Dtcs"
  end

  test "should create dtc" do
    visit dtcs_url
    click_on "New dtc"

    click_on "Create Dtc"

    assert_text "Dtc was successfully created"
    click_on "Back"
  end

  test "should update Dtc" do
    visit dtc_url(@dtc)
    click_on "Edit this dtc", match: :first

    click_on "Update Dtc"

    assert_text "Dtc was successfully updated"
    click_on "Back"
  end

  test "should destroy Dtc" do
    visit dtc_url(@dtc)
    click_on "Destroy this dtc", match: :first

    assert_text "Dtc was successfully destroyed"
  end
end
