def count(*args)
  return 0 if args == nil
  counter = 0
  score = 0
  limit = args.size

  while counter < limit
    score += 1 if yield(args[counter])
    counter += 1
  end
  score
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3