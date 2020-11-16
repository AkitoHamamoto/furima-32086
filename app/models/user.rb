class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items
  has_many  :purchases

  validates :nickname,        presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,           presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password,presence: true, length: { minimum: 6 }, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :first_name,      presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name,       presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :kana_first_name, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :kana_last_name,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date,      presence: true


end