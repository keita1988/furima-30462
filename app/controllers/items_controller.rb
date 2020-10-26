class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show]
  def index
    @items = Item.order("created_at DESC")
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

  def show
    
  end
  

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :deli_fee_id, :deli_area_id, :deli_day_id, :price).merge(user_id: current_user.id)
  end
end

private

   def set_item
    @item = Item.find(params[:id])
   end
