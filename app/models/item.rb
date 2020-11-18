class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :name
    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :price,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9_999_999
              },
              format: { with: PRICE_REGEX, message: '販売価格は半角数字のみ保存可能です' }
    validates :explanation
    validates :image
  end
  with_options  numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :day_id
  end
end
