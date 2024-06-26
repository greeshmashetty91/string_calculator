require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase
  test "empty string returns 0" do
    assert_equal 0, Calculator.add("")
  end

  test "single number returns the number itself" do
    assert_equal 1, Calculator.add("1")
  end

  test "two numbers separated by comma return their sum" do
    assert_equal 6, Calculator.add("1,5")
  end

  test "multiple numbers separated by comma return their sum" do
    assert_equal 15, Calculator.add("1,2,3,4,5")
  end

  test "multiple numbers are separated by comma or new line return their sum" do
    assert_equal 6, Calculator.add("1\n2,3")
  end

  test "input with invalid format return error message" do
    assert_equal "Numbers value is invalid", Calculator.add("1,\n")
  end

  test "custom delimiter is supported" do
    assert_equal 3, Calculator.add("//;\n1;2")
  end

  test "negative numbers are not allowed" do
    exception = assert_raises(StringCalculator::Errors::NegativeNumberFound) { Calculator.add("//;\n1;-2;3") }
    assert_equal "Negative numbers not allowed: -2", exception.message

    exception = assert_raises(StringCalculator::Errors::NegativeNumberFound) { Calculator.add("-1,2,-3") }
    assert_equal "Negative numbers not allowed: -1,-3", exception.message
  end
end