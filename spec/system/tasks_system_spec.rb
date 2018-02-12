require 'rails_helper'

RSpec.describe 'Task management', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'enambles me to create task' do
    visit '/'
    click_link 'Add new task'
    fill_in 'taskname', with: 'my new task'
    select 'important', from: 'Priority'
    fill_in 'Deadline', with: '27/02/2100'
    click_button 'submit'
    expect(page).to have_text('my new task')
  end

  it 'enables me to delete finished task' do
    visit '/'
    click_link 'Add new task'
    fill_in 'taskname', with: 'my new task'
    select 'important', from: 'Priority'
    fill_in 'Deadline', with: '27/02/2100'
    click_button 'submit'
    expect(page).to have_css("input[type='checkbox']", count: 1)
    page.check('tasks[]')
    click_button 'Remove checked tasks'
    expect(page).not_to have_text('my new task')
  end
end
