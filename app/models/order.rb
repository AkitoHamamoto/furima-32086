class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  atter_accessor :token
  validation :price, presence: true
  validation :token, presence: true
end
