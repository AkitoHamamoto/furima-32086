class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order("id DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless current_user.id == item.user_id
      redirect_to action: :index
    end
  end
end
