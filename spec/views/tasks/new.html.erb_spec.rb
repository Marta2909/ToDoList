require 'rails_helper'

RSpec.describe 'tasks/new' do
  it 'displays the form to add new task' do
    assign(:task, Task.new)
    render
    expect(rendered).to have_selector('form', id: 'new_task')
  end

  it 'is the new action of tasks controller view' do
    expect(controller.request.path_parameters[:controller]).to eq 'tasks'
    expect(controller.request.path_parameters[:action]).to eq 'new'
  end
end
