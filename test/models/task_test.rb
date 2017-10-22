require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should throw error" do
    t = Task.create(name: "t1", priority: "ważne", deadline: Date.yesterday - 1)
    assert_raises("data nie może być wcześniejsza niż dzisiaj") { deadline <= Date.yesterday }
  end

end
