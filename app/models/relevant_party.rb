class RelevantParty < ApplicationRecord
  belongs_to :user
  belongs_to :event
  enum attendance: { 未回答: 0, 出席: 1, 欠席: 2 }
end
