require 'rails_helper'

RSpec.describe 'routes for Tasks', type: :routing do
  it 'routes / to the tasks controller' do
    expect(get('/')).to route_to('tasks#index')
  end

  it 'routes /tasks/new to the tasks#new action' do
    expect(get('/tasks/new')).to route_to('tasks#new')
  end

  it 'routes post /tasks to the tasks#create action' do
    expect(post('/tasks')).to route_to('tasks#create')
  end

  it 'routes delete /tasks/multi_delete to the tasks#multi_delete action' do
    expect(delete('/tasks/multi_delete')).to route_to('tasks#multi_delete')
  end

  it 'route delete /tasks/1 doensn\'t exist' do
    expect(delete('/tasks/1')).not_to be_routable
  end
end
