class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'}
  validates :nickname, presence: true
  validates :first_name, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "is invalid. Input full-width characters"}
  validates :last_name, presence: true, format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "is invalid. Input full-width characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters" }
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters" }
  validates :birth_date, presence: true

  has_many :items
  # has_many :purchases
end
