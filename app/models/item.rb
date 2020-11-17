class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presense: true do
    validates :name
    validates :price,
              numericality: {
                only_integer: true, 
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9999999 
              }
              PRICE_REGEX = /\A[0-9]+\z/
              format: { with: PRICE_REGEX, message: '販売価格は半角数字のみ保存可能です'}
    validates :explanation
    validates :category_id 
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_id
  end

end
