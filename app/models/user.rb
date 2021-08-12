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

  def already_okeyed?(event)
    self.okeys.exists?(event_id: event.id)
  end

  validates :encrypted_password,     presence: true, length: { minimum: 8 }
  validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,         presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,        presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :email,                  presence: true, format: {with: /\A\S+@\S+\.\S+\z/ }

  def full_name
    self.last_name + self.first_name
  end

end
