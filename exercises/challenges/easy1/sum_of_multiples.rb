#Rules
# Find Sums of Multples UP TO but NOT INCLUDING specified number
# Sum these multples
# If no set is given, default to 3 and 5

class SumOfMultiples
  def initialize(*set)
    @set = set.empty? ? [3, 5] : set
  end

  def self.to(int, set = [3, 5])
    return 0 if int < set.min

    multiples(int, set).reduce(&:+)
  end

  def to(int) 
    return 0 if int < @set.min

    self.class.to(int, @set)
  end

  private

  def self.multiples(int, set)
    multiples = []

    set.each do |num|
      multiple = num
      while multiple < int
        multiples << multiple
        multiple += num
      end
    end
    multiples.uniq
  end
end 