class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,last_name,first_name,last_name_reading,last_name_reading,birth, presence: true
end




      t.date :birth,                null: false
      t.string :last_name,          null: false
      t.string :first_name,         null: false
      t.string :last_name_reading,  null: false
      t.string :last_name_reading, null: false