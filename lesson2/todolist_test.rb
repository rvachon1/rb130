require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'todo'

class TodoTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]
  end

  def test_todo_title
    assert_equal(@todo1.title, "Buy milk")
  end

  def test_todo_description
    assert_equal(@todo1.description, "")
  end

  def test_todo_done!
    @todo1.done!
    @todo2.done!
    @todo3.done!
    assert_equal(@todo1.done, true)
    assert_equal(@todo2.done, true)
    assert_equal(@todo3.done, true)
  end

  def test_todo_undone!
    @todo1.done!
    @todo1.undone!
    assert_equal(@todo1.done?, false)
  end

  def test_todo_to_s
    @todo2.done!
    assert_equal(@todo1.to_s, "[ ] Buy milk")
    assert_equal(@todo2.to_s, "[X] Clean room")
  end

  def test_todo_equality
    @todo4 = Todo.new("Buy milk")
    assert_equal(@todo1, @todo4)
  end
end

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@list.to_a, @todos)
  end

  def test_title_getter
    assert_equal(@list.title, "Today's Todos")
  end

  def test_title_setter
    @list.title = "Test Title"
    assert_equal(@list.title, "Test Title")
  end

  def test_size
    assert_equal(@list.size, 3)
  end

  def test_first
    assert_equal(@list.first, @todo1)
  end

  def test_last
    assert_equal(@list.last, @todo3)
  end

  def test_shift
    assert_equal(@list.shift, @todo1)
    assert_equal(@list.size, 2)
  end

  def test_pop
    assert_equal(@list.pop, @todo3)
    assert_equal(@list.size, 2)
  end

  def test_done?
    assert_equal(@list.done?, false)

    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(@list.done?, true)
  end

  def test_add_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("hello") }
  end

  def test_shovel
    @todo4 = Todo.new("Feed the cat")
    @list.add(@todo4)
    @todos << @todo4

    assert_equal(@list.last, @todos.last)
    assert_equal(@list.size, 4)
  end

  def test_add
    @todo4 = Todo.new("Feed the cat")
    @list.add(@todo4)

    assert_equal(@list.last, @todo4)
    assert_equal(@list.size, 4)
  end

  def test_item_at_error
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_item_at
    assert_equal(@list.item_at(1), @todo2)
  end

  def test_mark_done_at_error
    assert_raises(IndexError) { @list.mark_done_at(3) } 
  end

  def test_mark_done_at
    assert_equal(@list.mark_done_at(0), @todo1.done?)
  end

  def test_mark_undone_at_error
    assert_raises(IndexError) { @list.mark_undone_at(3) }
  end

  def test_mark_undone_at
    @todo1.done!
    @list.mark_undone_at(0)
    assert_equal(@todo1.done?, false)
  end

  def test_done!
    @list.done!
    assert_equal(@list.done?, true)
  end

  def test_remove_at_error
    assert_raises(IndexError) { @list.remove_at(3) }
  end

  def test_remove_at
    assert_equal(@list.remove_at(1), @todo2)
    assert_equal(@list.size, 2)
  end
  
  def test_to_s
    output = <<~OUTPUT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_list_done
    @list.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.done! }
    assert_equal(@list.done?, true)
  end

  def test_each_return
    return_value = @list.each { |_| "meow" }
    assert_equal(return_value, @list)
  end

  def test_select
    return_value = @list.select { |todo| todo.title == "Buy milk"}
    assert_equal(return_value.first, @todo1)
  end

  def test_select_none
    return_value = @list.select { |todo| todo.title == "No match" }
    assert_equal(return_value.size, 0)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    assert_equal(@list.all_done.size, 0)
    @list.done!
    assert_equal(@list.all_done.size, 3)
  end

  def test_all_not_done
    assert_equal(@list.all_not_done.size, 3)
    @list.done!
    assert_equal(@list.all_not_done.size, 0)
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(@todo1.done?, true)
  end

  def test_mark_all_done
    @list.mark_all_done

    assert_equal(@list.done?, true)
  end

  def test_mark_all_undone
    @list.mark_all_done
    assert_equal(@list.done?, true)
    @list.mark_all_undone
    assert_equal(@list.select { |todo| todo.done? == false }.size, 3)
  end
end