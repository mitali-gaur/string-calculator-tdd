require_relative "string_calculator"
require "test/unit"

class StringCalculatorTest < Test::Unit::TestCase
  def test_for_empty_string
    assert_equal(0, StringCalculator.new('').add)
  end

end
