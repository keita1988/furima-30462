class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :cerate]
  before_action :move_to_index,only: [:index ]

  def index
    @buyer_street_address = BuyerStreetAddress.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id ==  @item.user_id || @item.buyer
      redirect_to root_path
    end
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end