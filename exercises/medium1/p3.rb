items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end
# puts "#{items.join(', ')}"

gather(items) { |items| puts items.join(', ') }
