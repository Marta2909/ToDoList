require 'rails_helper'

RSpec.describe 'tasks/index' do
  it 'displays all the tasks' do
    assign(:tasks, [Task.create(name: 'task1', priority: 'important', deadline: Date.tomorrow), Task.create(name: 'task2', priority: 'important', deadline: Date.tomorrow)])
    render
    expect(rendered).to match /task1/
    expect(rendered).to match /task2/
  end

  it 'displays proper locals in a partial' do
    firsttask = Task.create(name: 'task1', priority: 'important', deadline: Date.tomorrow)
    secondtask = Task.create(name: 'task2', priority: 'important', deadline: Date.tomorrow)
    render partial: 'tasks/tasklist.html.erb', locals: { t: firsttask }
    expect(rendered).to match /task1/
    expect(rendered).not_to match /task2/
    expect(rendered).to have_text("TOMORROW")
  end

  it 'is the index action view' do
    expect(controller.request.path_parameters[:controller]).to eq('tasks')
    expect(controller.request.path_parameters[:action]).to eq('index')
  end
end
