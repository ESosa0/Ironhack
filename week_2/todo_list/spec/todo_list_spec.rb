require "rspec"
require "./todo_list.rb"

describe Task do 
  before :each do
    @subject = Task.new("Walk the dog.")
  end
  describe "#complete?" do
    it "checks if a task is done and returns true or false" do
      expect(@subject.complete?).to eq(false)
    end
  end
  describe "#complete!" do
    it "calls on an instance of a class and changes it to completed" do
      expect(@subject.complete!).to eq(true)
    end
  end
  describe "#make_incomplete!" do
  it "calls on an instance of a class and changes it to incomplete" do
      expect(@subject.make_incomplete!).to eq(false)
    end
  end
  describe "#update_content!" do
    it "will update the task's text" do
      @subject.update_content!("Buy the milk.")
      expect(@subject.content).to eq("Buy the milk.")
    end
  end
end

describe TodoList do
  before :each do
    @subject = TodoList.new("John")
    @task = Task.new("Walk the dog.")
  end
  describe "#add_task" do
    it "adds a task to the todo list array" do
      @subject.add_task(@task)
      expect(@subject.tasks[-1]).to eq(@task)
    end
  end
  describe "#delete_task" do
    it "takes a parameter of ID number and deletes associated task." do
      @subject.add_task(@task)
      @subject.delete_task(@task.id)
      expect(@subject.tasks.include?(@task)).to eq(false)
    end
  end
  describe "#find_task_by_id" do
    it "goes through a list of tasks and tries to find a specific task" do
     @subject.add_task(@task)
     expect(@subject.find_task_by_id(@task.id)).to eq(@task)
    end
    it "returns nil if find_task_by_id doesn't find id" do
      expect(@subject.find_task_by_id(@task.id)).to eq(nil)
    end
  end
  describe "#sort_by_created" do
    it "returns tasks sorted by date." do
      task1 = Task.new("Walk the dog")
      task2 = Task.new("Do the laundry")
      @subject.add_task(task2)
      @subject.add_task(task1)
      expect(@subject.sort_by_created).to eq([task1, task2])
    end
  end
  describe "#user" do
    it "returns the username" do
      expect(@subject.user).to eq("John")
    end
    it "returns nil when no username given" do
      anonymous_list = TodoList.new
      expect(anonymous_list.user).to eq(nil)
    end
  end
  describe "#load_tasks" do
    before :each do
      todo_list = TodoList.new("Josh")
      task = Task.new("Walk the dog")
      task2 = Task.new("Buy the milk")
      task3 = Task.new("Make my todo list into a web app")
      todo_list.add_task(task)
      todo_list.add_task(task2)
      todo_list.add_task(task3)
      todo_list.save
    end
    it "loads tasks from a file" do
      todo_list = TodoList.new("Josh")
      todo_list.load_tasks
      expect(todo_list.tasks.length).to eq(3)
    end
  end
end 
