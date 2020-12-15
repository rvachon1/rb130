# def zip(arr1, arr2)
#   counter = -1 
#   arr1.map do |item|
#     counter += 1
#     [item, arr2[counter]]
#   end
# end

def zip(arr1, arr2)
  counter = 0 
  zip_arr = []

  while counter < arr2.size
    zip_arr << [arr1[counter], arr2[counter]]
    counter += 1
  end
  zip_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]