class Task < ApplicationRecord
  validates :name, :priority, :deadline, presence: true
  validate :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline <= Date.yesterday
      errors.add(:deadline, 'past deadline is impossible')
    end
  end
end
