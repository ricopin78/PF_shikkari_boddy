class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos,              dependent: :destroy
  has_many :titles,             dependent: :destroy
  has_many :events,             dependent: :destroy
  has_many :relevant_parties,   dependent: :destroy
  has_many :okeys,              dependent: :destroy
  has_many :comments,           dependent: :destroy

end
