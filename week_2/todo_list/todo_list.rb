require 'pry'
require 'yaml/store'

class Task
  attr_reader :content, :id, :created_at
  @@current_id = 1
  def initialize(content)
    @content = content
    @id = @@current_id
    @@current_id += 1
    @completed = false
    @created_at = Time.now
  end
  def complete?
    @completed
  end
  def complete!
    @completed = true
  end
  def make_incomplete!
    @completed = false
  end
  def update_content!(new_content)
    @content = new_content
    @created_at = Time.now
    return new_content
  end
end

class TodoList
  attr_reader :tasks, :user
  def initialize(user=nil)
    @todo_store = YAML::Store.new("./public/tasks.yml")
    @tasks = []
    @user = user
  end
  def add_task(task)
    @tasks.push(task)
    return @tasks[-1]
  end
  def delete_task(id)
    @tasks.delete_if do |task|
      task.id == id
    end
  end
  def find_task_by_id(id)
    selection = @tasks.select do |task|
      task.id == id
    end
    return selection[-1]
  end
  def sort_by_created
    @tasks.sort { |task1, task2| task1.created_at <=> task2.created_at}
  end
  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end
  def load_tasks
    @tasks = @todo_store.transaction do 
      @todo_store[@user]
    end
  end
end

