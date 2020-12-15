class Todo
  DONE_MARKER = "X"
  UNDONE_MARKER = " "
  attr_reader :title, :description, :done

  def initialize(title, description="")
    @title = title
    @description = description
    @done = false
  end

  def done!
    @done = true
  end

  def undone!
    @done = false
  end

  def done?
    @done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other)
    (title == other.title) && (description == other.description) &&
      (done == other.done)
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" if todo.class != Todo
    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def done!
    @todos.map(&:done!)
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    self.item_at(idx).done!
  end

  def mark_undone_at(idx)
    self.item_at(idx).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    self.item_at(idx) # Error handling
    @todos.delete_at(idx)
  end

  def to_s
    "---- #{@title} ----\n"\
    "#{@todos.map { |todo| todo.to_s }.join("\n")}"
  end

  # def each
  #   counter = 0 

  #   while counter < size
  #     yield(item_at(counter))
  #     counter += 1
  #   end
  #   self
  # end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  # def select
  #   counter = 0
  #   selected = []

  #   while counter < self.size
  #     item = item_at(counter)
  #     selected << item if yield(item)
  #     counter += 1
  #   end
  #   selected
  # end

  # def select
  #   @todos.select do |todo|
  #     yield(todo)
  #   end
  # end

  def select
    new_list = TodoList.new("Selected Items")

    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect