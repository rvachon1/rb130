#---Select Method---

def select(array)
  counter = 0
  selected = []

  while counter < array.size
    selected << array[counter] if yield(array[counter])
    counter += 1
  end
  selected
end

p select([1,2,3,4]) { |num| num.odd? }