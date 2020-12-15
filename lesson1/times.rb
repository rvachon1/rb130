#--- Times Method ---
def times(num)
  counter = 0

  while counter < num
    yield(counter) if block_given?
    counter += 1
  end
  num
end

times(4) { |num| puts num }

