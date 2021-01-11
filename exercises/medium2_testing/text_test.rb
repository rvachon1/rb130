require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'
MiniTest::Reporters.use!

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample.txt', "r")
    @text = Text.new(@file.read)
  end

  def teardown
    @file.close
  end

  def test_swap
    a_count = @text.text.count("a")
    e_count = @text.text.count("e")
    e_count2 = @text.swap("a", "e").count("e")

    assert_equal(a_count + e_count, e_count2)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end
end
