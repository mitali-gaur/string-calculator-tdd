# Class to calculate sum for strings
class StringCalculator
  attr_accessor :input_str

  def initialize(input_str)
    @input_str = input_str.to_s
  end

  def add
    return 0 if input_str.length.zero?
    inputs = input_str.split(',')
    if inputs.length > 1
      inputs.map{ |input| input.to_i }.sum
    else
      return input_str.to_i
    end
  end

end
