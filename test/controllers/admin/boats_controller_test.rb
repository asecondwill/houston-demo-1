require "test_helper"

class Admin::BoatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boat = boats(:one)
  end

  test "should get index" do
    get admin_boats_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_boat_url
    assert_response :success
  end

  test "should create boat" do
    assert_difference("Boat.count") do
      post admin_boats_url, params: { boat: { description: @boat.description, length: @boat.length, name: @boat.name } }
    end

    assert_redirected_to admin_boat_url(Boat.last)
  end

  test "should show boat" do
    get admin_boat_url(@boat)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_boat_url(@boat)
    assert_response :success
  end

  test "should update boat" do
    patch admin_boat_url(@boat), params: { boat: { description: @boat.description, length: @boat.length, name: @boat.name } }
    assert_redirected_to admin_boat_url(@boat)
  end

  test "should destroy boat" do
    assert_difference("Boat.count", -1) do
      delete admin_boat_url(@boat)
    end

    assert_redirected_to admin_boats_url
  end
end
