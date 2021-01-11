class Cipher
  ALPHA = ("a".."z").to_a
  REV_ALPHA = ALPHA.reverse

  def self.encode(string)
    clean_str_arr = clean_string(string)
    str_idx_arr = alpha_index_finder(clean_str_arr)
    encoder(str_idx_arr)
  end

  def self.clean_string(string)
    string.downcase
          .scan(/[a-z\d]+/i)
          .join("")
          .chars
  end

  def self.alpha_index_finder(str_arr)
    str_idx_arr = []

    str_arr.each do |char|
      str_idx_arr << if ALPHA.include?(char)
                       ALPHA.index(char)
                     else
                       char
                     end
    end
    str_idx_arr
  end

  def self.encoder(idx_arr)
    encoded_arr = indexs_to_letters(idx_arr)
    space_encoding(encoded_arr)
  end

  def self.indexs_to_letters(idx_arr)
    encoded_letters = []

    idx_arr.each do |idx|
      encoded_letters << if idx.class == Integer
                           REV_ALPHA[idx]
                         else
                           idx
                         end
    end
    encoded_letters
  end

  def self.space_encoding(array)
    encoded_str = ""
    counter = 0

    while counter < array.length
      encoded_str << array[counter]
      encoded_str << " " if ((counter + 1) % 5 == 0) &&
                            (counter + 1 != array.size)
      counter += 1
    end
    encoded_str
  end
end
