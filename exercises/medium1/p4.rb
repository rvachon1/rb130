def some_method(array)
  yield(array)
end

some_method([1,2,3,4,5]) { |_, _, *raptors| puts raptors }