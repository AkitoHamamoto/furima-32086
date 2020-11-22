class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :item_id, :order_id, :user_id

  validates :token, presence: true

  with_options presence: true do
    POSTAL_REGEX = /\A\d{3}-\d{4}\z/.freeze
    validates :postal_code, format: { with: POSTAL_REGEX, message: '郵便番号には(-)を含む7桁の数字を入力してください' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    PHONE_REGEX = /\A\d{11}\z/.freeze
    validates :phone_number, format: { with: PHONE_REGEX, message: '携帯番号には(-)なしで11桁の数字を入力してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, order_id: order.id)
  end
end
