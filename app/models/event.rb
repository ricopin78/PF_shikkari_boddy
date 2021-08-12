class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :event_todos, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :relevant_parties, dependent: :destroy
  has_many :okeys, dependent: :destroy
  has_many :okeyed_users, through: :okeys, source: :user
  has_many :comments, dependent: :destroy
end
