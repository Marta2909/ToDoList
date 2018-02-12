require 'rails_helper'

RSpec.describe 'tasks/_tasklist partial' do
  it 'displays the proper task based on locals' do
    firsttask = Task.create(name: 'task1', priority: 'important', deadline: Date.tomorrow)
    secondtask = Task.create(name: 'task2', priority: 'important', deadline: Date.tomorrow)
    render 'tasks/tasklist', t: secondtask
    expect(rendered).to match /task2/
  end

  it 'doesn\'t belong to any action' do
    expect(controller.request.path_parameters[:controller]).to eq('tasks')
    expect(controller.request.path_parameters[:action]).to be_nil
  end
end
