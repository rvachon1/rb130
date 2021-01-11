class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 0

    sof = sum_of_factors(int)

    case
    when sof == int then "perfect"
    when sof > int then "abundant"
    when sof < int then "deficient"
    end
  end

  private

  def self.sum_of_factors(int)
    factors(int).reduce(&:+)
  end

  def self.factors(int)
    factors = []
    num = 1

    while num <= (int / 2)
      factors << num if int % num == 0
      num += 1
    end
    factors
  end
end