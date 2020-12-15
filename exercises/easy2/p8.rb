def max_by(arr)
  return nil if arr.size == 0
  max_value = yield(arr[0])
  max = arr[0]
  counter = 1
  limit = arr.size

  while counter < limit
    curr_max = yield(arr[counter])
    if curr_max > max_value
      max = arr[counter]
      max_value = curr_max
    end
    counter += 1
  end
  max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil