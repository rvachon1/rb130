class Octal
  INVALID_OCTAL = /\D+|[8-9]/

  def initialize(num_str)
    @num_str = validate_num(num_str)
  end

  def to_decimal
    return 0 if @num_str == 0
    power = @num_str.chars.size
    
    @num_str
      .chars
      .map(&:to_i)
      .reduce(0) do |acc, num|
        power -= 1
        acc += num*(8**power)
      end
  end

  private

  def validate_num(num_str)
    num_str =~ INVALID_OCTAL ? 0 : num_str
  end
end