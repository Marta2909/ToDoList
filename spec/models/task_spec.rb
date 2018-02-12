require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'with valid input' do
    it 'saves only tasks with filled in name, priority and deadline and deadline is not in the past' do
      task = Task.new(name: 'task', priority: 'common', deadline: Date.tomorrow)
      expect(task.save).to be true
    end
  end

  context 'with invalid data' do
    it 'doesn\'t save tasks with not filled name, priority or deadline' do
      task1 = Task.new(name: nil, priority: 'common', deadline: Date.tomorrow)
      task2 = Task.new(name: 'task', priority: nil, deadline: Date.tomorrow)
      task3 = Task.new(name: 'task', priority: 'common', deadline: nil)
      expect(task1.save).to be false
      expect(task2.save).to be false
      expect(task3.save).to be false
    end

    it 'doesn\'t save tasks with a psat deadline' do
      task = Task.new(name: 'task', priority: 'common', deadline: Date.yesterday)
      expect(task.save).to be false
    end
  end
end
