require 'rails_helper'

describe Task do

  context 'when task filled correctly' do
    it 'should be saved to database' do
      t = Task.new(name: "todo", priority: "ważne", deadline: Date.today + 1.day)
      expect(t.save).to be true
    end
  end

  context 'when task filled incorrectly' do
    it 'should not be saved to database without name' do
      t = Task.new(name: nil, priority: "ważne", deadline: Date.today + 1.day)
      expect(t.save).to be false
    end
    it 'should not be saved to database without priority' do
      t = Task.new(name: "todo", priority: nil, deadline: Date.today + 1.day)
      expect(t.save).to be false
    end
    it 'should not be saved to database without deadline' do
      t = Task.new(name: "todo", priority: "ważne", deadline: nil)
      expect(t.save).to be false
    end
    it 'should not be saved to database with incorrect deadline' do
      t = Task.new(name: "todo", priority: "ważne", deadline: Date.yesterday)
      expect(t.save).to be false
    end
  end

end
