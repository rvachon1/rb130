def divisors(num)
  # Iterate by one from one to and including num
  # Add to arr IF modulus returns 0 (evenenly divides)
  # Return arr
  arr = []
  counter = 1

  while counter <= num
    arr << counter if num % counter == 0
    counter += 1
  end
  arr
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute