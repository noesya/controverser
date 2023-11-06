require "application_system_test_case"

class TextsTest < ApplicationSystemTestCase
  setup do
    @text = texts(:one)
  end

  test "visiting the index" do
    visit texts_url
    assert_selector "h1", text: "Texts"
  end

  test "should create text" do
    visit texts_url
    click_on "New text"

    fill_in "Controversy", with: @text.controversy_id
    fill_in "Full text", with: @text.full_text
    fill_in "Image", with: @text.image
    fill_in "Slug", with: @text.slug
    fill_in "Source", with: @text.source
    fill_in "Summary long", with: @text.summary_long
    fill_in "Summary short", with: @text.summary_short
    fill_in "Title", with: @text.title
    fill_in "Url", with: @text.url
    click_on "Create Text"

    assert_text "Text was successfully created"
    click_on "Back"
  end

  test "should update Text" do
    visit text_url(@text)
    click_on "Edit this text", match: :first

    fill_in "Controversy", with: @text.controversy_id
    fill_in "Full text", with: @text.full_text
    fill_in "Image", with: @text.image
    fill_in "Slug", with: @text.slug
    fill_in "Source", with: @text.source
    fill_in "Summary long", with: @text.summary_long
    fill_in "Summary short", with: @text.summary_short
    fill_in "Title", with: @text.title
    fill_in "Url", with: @text.url
    click_on "Update Text"

    assert_text "Text was successfully updated"
    click_on "Back"
  end

  test "should destroy Text" do
    visit text_url(@text)
    click_on "Destroy this text", match: :first

    assert_text "Text was successfully destroyed"
  end
end
