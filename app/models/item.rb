class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deli_fee
  belongs_to_active_hash :deli_area
  belongs_to_active_hash :deli_day




  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image        
    validates :name         
    validates :description  
    validates :category     
    validates :status_id    
    validates :deli_fee_id  
    validates :deli_area_id 
    validates :deli_days_id
    validates :price, numericality: {integer: true,greater_than: 300, less_than: 9999999 }
  end

  validates :price, format: {with: /\A[0-9]+\z/
  }







  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:status_id, :deli_fee_id, :deli_area_id, :deli_days_id,numericality: { other_than: 1 }

  belongs_to :user
  has_one :buyer
  has_one_attached :image
end
