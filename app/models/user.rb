class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos,              dependent: :destroy
  has_many :titles,             dependent: :destroy
  has_many :events,             dependent: :destroy
  has_many :relevant_parties,   dependent: :destroy
  has_many :comments,           dependent: :destroy
  has_many :okeys,              dependent: :destroy
  has_many :okeyed_events,      through: :okeys, source: :event
  attachment :profile_image

  def already_okeyed?(event)
    okeys.exists?(event_id: event.id)
  end

  validates :password,     presence: true, length: { minimum: 8 }
  validates :last_name,              presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,         presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :email,                  presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :company,                presence: true

  def full_name
    last_name + first_name
  end

  def full_name_kana
    last_name_kana + first_name_kana
  end
end
