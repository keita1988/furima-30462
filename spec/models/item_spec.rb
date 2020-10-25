require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "全ての項目が入力された出品できる" do
      expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'category_idが--では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空では出品できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it 'status_id--では出品できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'deli_fee_idが空では出品できないこと' do
        @item.deli_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee can't be blank", "Deli fee is not a number")
      end
      it 'deli_fee_id--では出品できないこと' do
        @item.deli_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli fee must be other than 1")
      end
      it 'deli_area_idが空では出品できないこと' do
        @item.deli_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli area can't be blank", "Deli area is not a number")
      end
      it 'deli_area_idが--では出品できないこと' do
        @item.deli_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli area must be other than 1")
      end
      it 'deli_day_idが空では出品できないこと' do
        @item.deli_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli days can't be blank", "Deli days is not a number")
      end
      it 'deli_day_idが--では出品できないこと' do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deli days must be other than 1")
      end
      it 'priceが空では出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では登録できないこと' do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceの数値が300未満では登録できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceの数値が10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end