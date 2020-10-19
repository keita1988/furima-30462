class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #has_many :items
         #has_many :buyers
      
      with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
        validates :first_name
        validates :last_name
        validates :first_name_kana
        validates :last_name_kana
      end
        validates :nickname
        validates :birthday


end
