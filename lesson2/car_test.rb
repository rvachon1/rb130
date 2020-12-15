require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_car_exists
    assert(@car)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do 
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    array = [1,2,3,4]

    array << @car

    assert_includes(array, @car)
  end

  # def test_bad_wheels
  #   skip "Message to console"
  #   car = Car.new
  #   assert_equal(3, car.wheels)
  # end
  
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
    assert_same(car1, car2)
  end
end