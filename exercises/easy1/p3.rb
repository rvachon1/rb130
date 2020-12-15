def missing(array)
  full_range = (array[0]..array[-1]).to_a

  full_range.select do |item|
    !array.include?(item)
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []