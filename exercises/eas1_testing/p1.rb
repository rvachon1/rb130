require 'minitest/autorun'

class EasyTesting < MiniTest::Test
  attr_reader :value

  def test_value_odd
    value = 2
    assert_equal(true, value.odd?)
  end

  def test_value_downcase_xyz
    value = "ABC"
    assert_equal('xyz', value.downcase)
  end

  def test_value_not_nil
    value = 1

    assert_nil(value)
  end

  def test_value_empty
    value = []

    assert_empty(value)
    assert_equal([], value)
  end

  def test_xyz_in_list
    value = 'xyz'
    array = [1,2,3,4]

    assert_equal(true, array.include?(value))
    assert_includes(array, value)
  end

  def test_employee_hirez_no_experience_error
    assert_raises(NoExperienceError) {employee.hire }
  end

  assert_equal(Numeric, value.class)
  assert_instance_of(Numeric, value)

  assert_kind_of(Numeric, value)
  assert_equal(true, value.kind_of?(Numeric))

  assert_equal(list.object_id, list.process.object_id)
  assert_same(list, list.process)

  refute_includes(list, 'xyz')
end