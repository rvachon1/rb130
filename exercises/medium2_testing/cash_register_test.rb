require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'
MiniTest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @cashreg = CashRegister.new(100)
  end

  def test_accept_money
    @trans1 = Transaction.new(25)
    @trans1.amount_paid = 25
    
    @cashreg.accept_money(@trans1)

    assert_equal(@cashreg.total_money, 125)
  end

  def test_change
    @trans1 = Transaction.new(25)
    @trans1.amount_paid = 30

    assert_equal(@cashreg.change(@trans1), 5)
  end

  def test_give_receipt
    @trans1 = Transaction.new(25)
    output = <<~OUTPUT
    You've paid $25.
    OUTPUT

    assert_output(output) { @cashreg.give_receipt(@trans1) }
  end

  
end