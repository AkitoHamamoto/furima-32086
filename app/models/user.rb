class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :items
  has_many  :purchases

  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'には@のつくアドレスを入力してください' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, length: { minimum: 6 }, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    validates :first_name,      format: { with: NAME_REGEX,  message: 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    validates :last_name,       format: { with: NAME_REGEX,  message: 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :kana_first_name, format: { with: KANA_NAME_REGEX, message: 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で' }
    validates :kana_last_name,  format: { with: KANA_NAME_REGEX, message: 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須で' }
    validates :birth_date
  end
end
