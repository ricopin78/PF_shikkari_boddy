class EventTodo < ApplicationRecord
  belongs_to :event
  validates :deadline,      presence: true
  validates :title,         presence: true
  validates :duration,      presence: true
end
