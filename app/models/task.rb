class Task < ApplicationRecord
  validates :name, :priority, :deadline, presence: true
  validate :deadline_cannot_be_in_the_past

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline <= Date.yesterday
      errors.add(:deadline, "data nie może być wcześniejsza niż dzisiaj")
    end
  end
end
