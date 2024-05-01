# Class to calculate sum for strings
class StringCalculator
  attr_accessor :input_str

  def initialize(input_str)
    @input_str = input_str.to_s
  end

  def add
    return 0 if input_str.length.zero?
    updated_input_str = input_str.gsub(/\n/, ',')
    raise if input_str.include?(",\n") || input_str.include?("\n,")

    inputs = updated_input_str.split(',')

    if inputs.length > 1
      negatives = inputs.filter{ |input| input.to_i.negative? }
      raise "negative numbers not allowed #{negatives.join(', ')}" if negatives.length > 0

      inputs.map{ |input| input.to_i }.sum
    else
      return input_str.to_i
    end
  end

end
