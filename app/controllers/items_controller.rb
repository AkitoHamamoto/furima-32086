class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit
  before_action :sold_out, only: :edit

  def index
    @items = Item.includes(:user).order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def sold_out
    redirect_to action: :index if @item.order.present?
  end
end
