class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_reading, :first_name_reading, :birth, presence: true
  validates :last_name, :first_name, format: { with: /\A[\p{hiragana}\p{katakana}\p{blank}ー－]+\z/, message: "は全角で入力してください" }
validates :last_name_reading, :first_name_reading, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
end