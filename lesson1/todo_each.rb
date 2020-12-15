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

  #   while counter < self.size
  #     yield(self.item_at(counter))
  #     counter += 1
  #   end
  #   self
  # end

  def each
    @todos.each do |todo|
      yield(todo)
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

a = list.each do |todo|
  puts todo                   # calls Todo#to_s
end