require 'rails_helper'

RSpec.describe 'Task management', type: :request do
  context 'when creating new task' do
    it 'creates a task and adds it to the task list' do
      get '/tasks/new'
      expect(response).to render_template(:new)

      post '/tasks', params: { task: { name: 'task1', priority: 'important', deadline: Date.tomorrow } }
      expect(response).to redirect_to('/')

      follow_redirect!
      expect(response.body).to include('task1')
    end

    it 'doesn\'t render different template' do
      get '/tasks/new'
      expect(response).not_to render_template(:index)
    end
  end

  context 'when deleting finished tasks' do
    before(:each) do
      get '/tasks/new'
      post '/tasks', params: { task: { name: 'task1', priority: 'important', deadline: Date.tomorrow } }
      get '/tasks/new'
      post '/tasks', params: { task: { name: 'task2', priority: 'common', deadline: Date.tomorrow } }
    end

    it 'deletes pointed tasks from the task list' do
      delete '/tasks/multi_delete', params: { tasks: Task.last.id }
      expect(response).to redirect_to('/')
      expect(response.body).not_to include('task2')
    end

    it 'doesn\'t render different template' do
      delete '/tasks/multi_delete', params: { tasks: Task.last.id }
      expect(response).not_to redirect_to('/tasks/new')
    end
  end
end
