class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
    redirect_to root_path if current_user != @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if current_user == @item.user
      if @item.destroy
        redirect_to root_path
      else
        render 'show'
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :deli_fee_id, :deli_area_id, :deli_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
