class Attachment < ApplicationRecord
  belongs_to :event
  has_attached_file :file
end
