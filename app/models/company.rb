class Company < ApplicationRecord
  has_many :users,         dependent: :destroy
  validates :company_id,   presence: true
  validates :name,         presence: true
end