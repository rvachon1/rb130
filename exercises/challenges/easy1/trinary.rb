class Trinary
  def initialize(string)
    @num = trinary_validator(string)
  end

  def trinary_validator(string)
    string =~ /\A[0-2]+\z/ ? string : nil
  end

  def to_decimal
    return 0 if !@num

    num = @num.reverse
    counter = -1 

    num.chars.reduce(0) do |sum, n|
      counter += 1
      sum += n.to_i * 3 ** counter
    end
  end
end