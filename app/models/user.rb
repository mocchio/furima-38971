class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # パスワードが半角英数字混合での入力が必須であることのバリデーション
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :name_last, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_first, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :name_first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth, presence: true

  has_many :items
  has_many :orders
end
