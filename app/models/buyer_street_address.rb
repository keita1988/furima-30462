class BuyerStreetAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :city, :address, :appointment_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/	}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    validates :token
  end

  validates :prefectures_id, numericality: { other_than: 1 }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(post_code: post_code, prefectures_id: prefectures_id, city: city, address: address, appointment_name: appointment_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
