class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day, presence: true
  validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
end
