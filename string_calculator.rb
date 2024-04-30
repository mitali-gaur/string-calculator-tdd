# Class to calculate sum for strings
class StringCalculator
  attr_accessor :input_str

  def initialize(input_str)
    @input_str = input_str.to_s
  end

  def add
    return 0 if input_str.length.zero?
  end

end
