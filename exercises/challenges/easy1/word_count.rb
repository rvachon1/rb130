class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    count_arr = Hash.new(0)

    @string.scan(/\w+(?:\'\w)?/) do |word|
      count_arr[word.downcase] += 1
    end
    count_arr
  end 
end
