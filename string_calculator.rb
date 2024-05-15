# Class to calculate sum for strings
class StringCalculator
  DEFAULT_DELIMITER = ','
  NEWLINE_CHAR = "\n"

  attr_accessor :input_str, :delimiter

  def initialize(input_str)
    @input_str = input_str.to_s
    @delimiter = fetch_delimiter
  end

  def add
    return 0 if input_str.empty?

    numbers = get_input_numbers
    raise_error_if_negatives_present(numbers)

    numbers.sum
  end

  private

  def fetch_delimiter
    custom_delimiter_present? ? input_str[2] : DEFAULT_DELIMITER
  end

  def custom_delimiter_present?
    input_str.start_with?("//") && input_str[3] == NEWLINE_CHAR
  end

  def get_input_numbers
    updated_input_str = custom_delimiter_present? ? input_str[4..-1] : input_str
    raise if updated_input_str.include?(",\n") || updated_input_str.include?("\n,")

    updated_input_str.gsub(NEWLINE_CHAR, delimiter).split(delimiter).map(&:to_i)
  end

  def raise_error_if_negatives_present(numbers)
    negatives = numbers.select(&:negative?)
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
