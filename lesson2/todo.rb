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
    "#{@todos.map { |todo| todo.to_s }.join("\n")}\n"
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new("Selected Items")

    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    selected = select do |todo|
      todo.title == title
    end
    selected.size > 0 ? selected.first : nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    todo = find_by_title(title) 
    todo ? todo.done! : "No Title Exists" 
  end

  def mark_all_done
    all_not_done.each do |todo|
                    todo.done!
                  end
    self
  end

  def mark_all_undone
    all_done.each do |todo|
                    todo.undone!
                  end
    self
  end
end