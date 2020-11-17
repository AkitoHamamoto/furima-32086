class ItemsController < ApplicationController
  def index
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
end
