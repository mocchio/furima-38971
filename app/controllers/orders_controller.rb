class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item

  def index
    @order_shipping_address = OrderShippingAddress.new
    if user_signed_in?
      if @item.order.present? || (current_user == @item.user)
        redirect_to root_path
      end
    end
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
