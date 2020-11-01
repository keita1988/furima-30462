class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_street_address = BuyerStreetAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_street_address = BuyerStreetAddress.new(buyer_params)
    if @buyer_street_address.valid?
      pay_item
      @buyer_street_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_street_address).permit(:post_code, :prefectures_id, :city, :address, :appointment_name, :phone_number, :item_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_e524ce99941345158d657d6a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end