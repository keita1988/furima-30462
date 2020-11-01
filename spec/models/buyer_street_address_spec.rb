require 'rails_helper'

RSpec.describe BuyerStreetAddress, type: :model do
  describe '購入機能' do
    before do
      @buyer_street_address = FactoryBot.build(:buyer_street_address)
    end
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@buyer_street_address).to be_valid
    end
    it '郵便番号が空だと購入できない事' do
      @buyer_street_address.post_code = nil
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
    end
    it '郵便番号が数字７桁でかつハイフンを含んでいる時購入できる事' do
      @buyer_street_address.post_code = '123'
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Post code is invalid")
    end
    it '都道府県が--が選択されている時購入できない事' do
      @buyer_street_address.prefectures_id = 1
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Prefectures must be other than 1")
    end
    it '市町村が空の場合は購入できない事' do
      @buyer_street_address.city = nil
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空の状態は購入できない事' do
      @buyer_street_address.address = nil
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空の状態は購入できない事' do
      @buyer_street_address.phone_number = nil
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it '電話番号が数字のみでないと購入できない事' do
      @buyer_street_address.phone_number = 'あa11'
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が11桁の未満だと購入できない事' do
      @buyer_street_address.phone_number = 00000
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上だと購入できない事' do
      @buyer_street_address.phone_number = 000000000000
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'クレジットカードの情報が正しくない時購入できない事' do
      @buyer_street_address.token = nil
      @buyer_street_address.valid?
      expect(@buyer_street_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end