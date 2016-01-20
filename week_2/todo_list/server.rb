require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative('lib/task.rb')
require_relative('lib/todo_list.rb')

joshs_list = TodoList.new("Josh")
joshs_list.load_tasks

get '/tasks' do
  @joshs_todos = joshs_list.tasks
  erb :task_index
end

get '/new_task' do
  erb :form
end

post '/create_task' do
  @content = params[:content]
  task= Task.new(@content)
  joshs_list.add_task(task)
  joshs_list.save
  redirect '/tasks'
end

get '/complete_task/:id' do
  id = params[:id].to_i
  done_task = joshs_list.find_task_by_id(id)
  done_task.complete!
  joshs_list.save
  redirect '/tasks'
end

post '/delete_task' do
  id = params[:id].to_i
  joshs_list.delete_task(id)
  joshs_list.save
  redirect '/tasks'
  end

