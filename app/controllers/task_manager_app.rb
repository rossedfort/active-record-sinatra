class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all
    erb :tasks_index
  end

  post '/tasks' do
    task = Task.new(params[:task])
    #instead of having the controller handle multiple cases, move
    #some param checking to it's own class/model
    #and bring it into the controller
    if task.save
      "Task Created!"
    else
      status 400
      body task.errors.full_messages.join(", ")
    end
  end

  get '/users' do
    @statuses = Status.all
    @users = User.all
    erb :users_index
  end
end
