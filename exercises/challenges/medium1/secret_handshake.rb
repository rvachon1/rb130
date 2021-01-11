class SecretHandshake
  COM = {
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump",
    10000 => "reverse"
  }

  def initialize(int)
    @code = int
    @commands = []
    set_binary
  end

  def commands
    ten_thou, mod = @binary.to_i.divmod(10000)
    thou, mod = mod.divmod(1000)
    hund, mod = mod.divmod(100)
    tens, ones = mod.divmod(10)

    build_commands(ten_thou, thou, hund, tens, ones)
  end

  private
  
  def set_binary
    if @code.class == Integer
      @binary = @code.to_s(2)
    elsif @code =~ /\A[01]+\z/
      @binary = @code
    else
      @binary = 0
    end
  end

  def build_commands(ten_thou, thou, hund, tens, ones)
    @commands << COM[1] if ones == 1
    @commands << COM[10] if tens == 1
    @commands << COM[100] if hund == 1
    @commands << COM[1000] if thou == 1

    ten_thou == 1 ? @commands.reverse : @commands
  end
end