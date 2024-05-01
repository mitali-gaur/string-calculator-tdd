# Class to calculate sum for strings
class StringCalculator
  attr_accessor :input_str

  def initialize(input_str)
    @input_str = input_str.to_s
  end

  def add
    return 0 if input_str.length.zero?

    delimiter = ","
    if input_str[0,2] == "//" && input_str[3] = "\n"
      delimiter = input_str[2]
      total_length = input_str.length - 1
      updated_input_str = input_str[4, total_length]
    end

    updated_input_str = updated_input_str ? updated_input_str : input_str

    raise if updated_input_str.include?(",\n") || updated_input_str.include?("\n,")

    updated_input_str = updated_input_str.gsub(/\n/, ',')
    inputs = updated_input_str.split(delimiter)

    if inputs.length > 1
      negatives = inputs.filter{ |input| input.to_i.negative? }
      raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.length > 0

      inputs.map{ |input| input.to_i }.sum
    else
      return input_str.to_i
    end
  end

end
