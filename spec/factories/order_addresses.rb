FactoryBot.define do
  factory :order_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '334-5434' }
    prefecture_id  { 3 }
    city           { '秋田市秋田郡' }
    address_line   { '5丁目32番地4' }
    building       { '東京駅506号室' }
    phone_number   { '09012345678' }
  end
end
