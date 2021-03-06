class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  validates :password, format:
  { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers" }
  
  with_options presence: true, format:
  { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: "Full-width characters" } do
    validates :last_name
    validates :first_name
  end
  
  with_options presence: true, format:
  { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
    validates :last_name_kana
    validates :first_name_kana
  end
  
  has_many :items

end