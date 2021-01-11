#Convert Integer to Roman Numeral
# 1. Initialize Hash Constant w/ integer and correspdoning Roman Numeral
# 2. Starting w/ 1000s determine the digit in each spot
# 3. Determine the Roman Numeral equivalent of each spot

class Integer
  ROMAN = {
    hund: ["C", "D", "M"],
    tens: ["X", "L", "C"],
    ones: ["I", "V", "X"]
  }

  def to_roman
    thou, mod = self.divmod(1000)
    hund, mod = mod.divmod(100)
    tens, ones = mod.divmod(10)

    thou = rom_thou(thou)
    hund = rom(hund, :hund)
    tens = rom(tens, :tens)
    ones = rom(ones, :ones)

    thou + hund + tens + ones
  end

  private

  def rom_thou(int)
    return "" if int == 0

    "M" * int
  end

  def rom(int, place)
    return "" if int == 0
    rom_arr = ROMAN[place]

    case
    when int <= 3 then rom_arr[0] * int
    when int == 4 then rom_arr[0] + rom_arr[1]
    when int <= 8 then rom_arr[1] + (rom_arr[0] * (int - 5))
    when int == 9 then rom_arr[0] + rom_arr[2]
    end
  end
end