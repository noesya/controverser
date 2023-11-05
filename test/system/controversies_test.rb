require "application_system_test_case"

class ControversiesTest < ApplicationSystemTestCase
  setup do
    @controversy = controversies(:one)
  end

  test "visiting the index" do
    visit controversies_url
    assert_selector "h1", text: "Controversies"
  end

  test "should create controversy" do
    visit controversies_url
    click_on "New controversy"

    fill_in "Name", with: @controversy.name
    fill_in "Slug", with: @controversy.slug
    fill_in "Text", with: @controversy.text
    click_on "Create Controversy"

    assert_text "Controversy was successfully created"
    click_on "Back"
  end

  test "should update Controversy" do
    visit controversy_url(@controversy)
    click_on "Edit this controversy", match: :first

    fill_in "Name", with: @controversy.name
    fill_in "Slug", with: @controversy.slug
    fill_in "Text", with: @controversy.text
    click_on "Update Controversy"

    assert_text "Controversy was successfully updated"
    click_on "Back"
  end

  test "should destroy Controversy" do
    visit controversy_url(@controversy)
    click_on "Destroy this controversy", match: :first

    assert_text "Controversy was successfully destroyed"
  end
end
