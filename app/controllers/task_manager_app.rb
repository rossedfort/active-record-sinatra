class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all
    erb :tasks_index
  end

  get '/users' do
    @statuses = Status.all
    @users = User.all
    erb :users_index
  end
end
