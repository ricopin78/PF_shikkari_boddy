class Todo < ApplicationRecord
  belongs_to :user
  enum rank: { 重要×緊急: 0, 重要×緊急でない: 1, 重要でない×緊急: 2, 重要でない×緊急でない: 3 }
end
