require './test/test_helper'

class CreateTaskTest < Minitest::Test
  include Rack::Test::Methods     # allows us to use get, post, last_request, etc.

  def app     # def app is something that Rack::Test is looking for
    TaskManager
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_create_task_with_valid_attributes
    post '/tasks', {task: {title: "Something",
                          description: "Something else",
                          user_id: 1,
                          status_id: 1 } }

    assert_equal 1, Task.count
    assert_equal 200, last_response.status
    assert_equal "Task Created!", last_response.body
  end

  def test_cannot_create_task_without_title
    post '/tasks', {task: {description: "Something else",
                           user_id: 1,
                           status_id: 1 } }

    assert_equal 0, Task.count
    assert_equal 400, last_response.status
    assert_equal "Title can't be blank", last_response.body
  end
end
