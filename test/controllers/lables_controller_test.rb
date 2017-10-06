require 'test_helper'

class LablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lable = lables(:one)
  end

  test "should get index" do
    get lables_url
    assert_response :success
  end

  test "should get new" do
    get new_lable_url
    assert_response :success
  end

  test "should create lable" do
    assert_difference('Lable.count') do
      post lables_url, params: { lable: { name: @lable.name, number: @lable.number } }
    end

    assert_redirected_to lable_url(Lable.last)
  end

  test "should show lable" do
    get lable_url(@lable)
    assert_response :success
  end

  test "should get edit" do
    get edit_lable_url(@lable)
    assert_response :success
  end

  test "should update lable" do
    patch lable_url(@lable), params: { lable: { name: @lable.name, number: @lable.number } }
    assert_redirected_to lable_url(@lable)
  end

  test "should destroy lable" do
    assert_difference('Lable.count', -1) do
      delete lable_url(@lable)
    end

    assert_redirected_to lables_url
  end
end
