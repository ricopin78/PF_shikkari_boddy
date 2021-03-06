class Event < ApplicationRecord
  belongs_to :user
  has_many :event_todos,      dependent: :destroy
  has_many :okeys,            dependent: :destroy
  has_many :okeyed_users,     through: :okeys, source: :user
  has_many :comments,         dependent: :destroy
  has_many :relevant_parties, dependent: :destroy
  accepts_nested_attributes_for :relevant_parties, allow_destroy: true

  validates :start_time,      presence: true
  validates :finish_time,     presence: true
  validates :title,           presence: true
end
