names = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

ALPHA = ("a".."z").to_a

#ALGO
# Split string into chars
# Advance each char 13 spaces by iterating over string and doing:
  # Find index of current letter in alphebet
  # Add thirteen to idx
  # Return new letter
# Join string

def rot13(string)
  chars = string.chars

  chars.map do |char|
    rotate_char(char)
  end.join
end

def rotate_char(char)
  return char if !ALPHA.include?(char.downcase)

  index = ALPHA.index(char.downcase)

  index = if (index + 13) > 25
            13 - (26 - index)
          else
            index + 13
          end

  if char.upcase == char
    ALPHA[index].upcase
  elsif char.downcase == char
    ALPHA[index]
  else
    char
  end
end

names.each do |name|
  puts rot13(name)
end