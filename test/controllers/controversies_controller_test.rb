require "test_helper"

class ControversiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @controversy = controversies(:one)
  end

  test "should get index" do
    get controversies_url
    assert_response :success
  end

  test "should get new" do
    get new_controversy_url
    assert_response :success
  end

  test "should create controversy" do
    assert_difference("Controversy.count") do
      post controversies_url, params: { controversy: { name: @controversy.name, slug: @controversy.slug, text: @controversy.text } }
    end

    assert_redirected_to controversy_url(Controversy.last)
  end

  test "should show controversy" do
    get controversy_url(@controversy)
    assert_response :success
  end

  test "should get edit" do
    get edit_controversy_url(@controversy)
    assert_response :success
  end

  test "should update controversy" do
    patch controversy_url(@controversy), params: { controversy: { name: @controversy.name, slug: @controversy.slug, text: @controversy.text } }
    assert_redirected_to controversy_url(@controversy)
  end

  test "should destroy controversy" do
    assert_difference("Controversy.count", -1) do
      delete controversy_url(@controversy)
    end

    assert_redirected_to controversies_url
  end
end
