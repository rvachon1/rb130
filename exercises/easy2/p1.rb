def step(first, last, step)
  counter = first

  while counter <= last
    yield(counter)
    counter += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }