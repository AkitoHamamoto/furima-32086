class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  with_options presense: true do
    validates :name
    validates :price
    validates :explanation
    validates :category_id 
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_id
    validates :user
  end

end
