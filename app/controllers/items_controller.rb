class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @item = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
