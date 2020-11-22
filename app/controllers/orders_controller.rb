class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :sold_out, only: :index
  before_action :move_to_item_index, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def sold_out
    if @item.order.present?
      redirect_to root_path 
    end
  end

  def move_to_item_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end 
  end
end
