require 'test_helper'

class CalculatorControllerTest < ActionController::TestCase
  test "POST add_numbers with valid numbers" do
    post :add_numbers, params: { numbers: "1,2,3" }
    assert_response :success
    assert_equal({ "result" => 6 }, JSON.parse(response.body))
  end

  test "POST add_numbers with negative numbers" do
    post :add_numbers, params: { numbers: "1,-2,3" }
    assert_response :unprocessable_entity
    assert_equal({ "error" => "Negative numbers not allowed: -2" }, JSON.parse(response.body))
  end

  test "POST add_numbers with invalid format" do
    post :add_numbers, params: { numbers: "1,\n" }
    assert_response :unprocessable_entity
    assert_equal({ "error" => "Numbers value is invalid" }, JSON.parse(response.body))
  end
end