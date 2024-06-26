require_relative "string_calculator"
require "test/unit"

class StringCalculatorTest < Test::Unit::TestCase
  def test_for_empty_string
    assert_equal(0, StringCalculator.new('').add)
  end

  def test_for_one_number
    assert_equal(1, StringCalculator.new('1').add)
    assert_equal(2, StringCalculator.new('2').add)
    assert_equal(10, StringCalculator.new('10').add)
  end

  def test_for_two_numbers
    assert_equal(3, StringCalculator.new('1,2').add)
    assert_equal(15, StringCalculator.new('5,10').add)
    assert_equal(28, StringCalculator.new('3,25').add)
  end

  def test_for_n_numbers
    assert_equal(7, StringCalculator.new('1,2,4').add)
    assert_equal(30, StringCalculator.new('5,10,5,10').add)
    assert_equal(40, StringCalculator.new('3,25,2,10').add)
  end

  def test_for_valid_new_line_separator
    assert_equal(6, StringCalculator.new("1\n2,3").add)
  end

  def test_for_invalid_new_line_separator
    assert_raise( RuntimeError ) { StringCalculator.new("1,\n").add }
    assert_raise( RuntimeError ) { StringCalculator.new("1\n,").add }
  end

  def test_for_negative_numbers
    assert_raise( "negative numbers not allowed -1" ) { StringCalculator.new("-1,2,5").add }
    assert_raise( "negative numbers not allowed -10, -5" ) { StringCalculator.new("1,2,-5,8,-10").add }
  end

  def test_for_different_delimiter
    assert_equal(3, StringCalculator.new("//;\n1;2").add)
    assert_equal(18, StringCalculator.new("//#\n2#6#10").add)
    assert_equal(60, StringCalculator.new("//.\n10.20.30").add)
  end
end
