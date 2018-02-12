require 'rails_helper'

RSpec.feature 'Task management', type: :feature do
  context 'adding new task' do
    scenario 'User creates a new task successfully' do
      visit '/'
      click_link 'Add new task'
      fill_in 'taskname', with: 'my new task'
      select 'important', from: 'Priority'
      fill_in 'Deadline', with: '27/02/2100'
      click_button 'submit'
      expect(page).to have_text('my new task')
    end

    scenario 'User creates a new task unsuccessfully' do
      visit '/'
      click_link 'Add new task'
      fill_in 'taskname', with: 'my new task'
      select 'important', from: 'Priority'
      click_button 'submit'
      expect(page).not_to have_text('my new task')
      expect(page).to have_button('submit')
    end
  end

  context 'removing finished task' do
    scenario 'User deletes task from tasks list' do
      visit '/'
      click_link 'Add new task'
      fill_in 'taskname', with: 'my new task'
      select 'important', from: 'Priority'
      fill_in 'Deadline', with: '27/02/2100'
      click_button 'submit'
      expect(page).to have_css('input[type=\'checkbox\']', count: 1)
      page.check('tasks[]')
      click_button 'Remove checked tasks'
      expect(page).not_to have_text('my new task')
    end
  end
end
