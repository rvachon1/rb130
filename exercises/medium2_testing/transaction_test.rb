require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'
MiniTest::Reporters.use!

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    @trans1 = Transaction.new(25)
    input = StringIO.new("30\n")
    @trans1.prompt_for_payment(input: input)

    silence do
      assert_equal(30, @trans1.amount_paid)
    end
  end

  private

  def silence
    $stdout = StringIO.new

    yield
  ensure
    $stdout = STDOUT
  end
end
