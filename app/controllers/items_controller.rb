class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new' and return
    end
  end
  

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :deli_fee_id, :deli_area_id, :deli_days_id, :price).merge(user_id: current_user.id)
  end
end
