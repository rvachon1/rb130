=begin
ALGO:
-Create array of digits from 2 to number specified, num_arr
-Create empty array to hold non-prime numbers called, marked_arr
-Create empty array to hold prime numbers called, prime_arr
-Set an incrementer, p, equal to 2
-Set a multiplier, m, equal to 2
-Iterate from m*p to num
  -Iterate from m*p to num
    -Shovel m*p into marked_arr
    -Increment m by 1
  -Set p to the minimum digit NOT MARKED (min in num_arr - marked_arr)
  -set m to 2
-Return prime_arr
=end
class Sieve
  def initialize(num)
    @num = num
  end

  def primes
    num_arr = (2...@num).to_a
    marked_arr = []
    p_arr = []
    p = 2
    m = 2

    while m*p < @num
      while m*p < @num
        marked_arr << m*p
        m += 1
      end
      m = 2
      p_arr << p
      p = (num_arr - marked_arr - p_arr).min
    end
    num_arr - marked_arr
  end
end
