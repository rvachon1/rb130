=begin
Write a program that will take a string of digits and give you all the possible 
consecutive number series of length n in that string.

Rules:
-Input: String of digits
-Ouput: Array of digit arrays
-Sliced arrays must consist of consecutive numbers
-Every sliced array must be unique
-Raises ArgumentError if size of sliced array is greater than num of String digits

ALGO:
-Initialize array to hold sliced arrays: slices
-Iterate through each digit in string
  -Grab specified number of items: num
  -Convert them to integer
  -Shovel into slices
-Return slices
=end

class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(num)
    validate_input(num)

    slices = []
    counter = 0

    while counter <= (@digits.size-num)
      slices << @digits[counter..counter+num-1]
      counter += 1
    end
    slices
  end

  private

  def validate_input(num)
    raise ArgumentError, "Argument too big for Digit String." if num > @digits.size
  end
end
