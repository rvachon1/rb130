#Rules
# - Returns array of anagram strings
# - Return empty Array if no matches
# - #match input is always an Array of Strings
# - Idential word is NOT an anagram

class Anagram
  def initialize(key)
    @key = key
  end

  def match(str_arr)
    str_arr.select { |word| anagram? word }
  end

  private

  def anagram?(word)
    word_d = word.downcase

    @key.downcase.chars.all? do |char|
      if word_d.include?(char)
        word_d.sub!(char, "")
      else
        false
      end
    end && (word.length == @key.length) && (word.downcase != @key.downcase)
  end
end

# I overcomplicated this by removing each matching letter from the word I was testing
# I should have instead recognized it was an overcomplication, and restareted
# Hopefully then I would have realized the easier way to do it was to
# downcase, chars, and sort the key, and compare that to the same methods used
# on the word.