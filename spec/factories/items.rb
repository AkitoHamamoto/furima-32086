FactoryBot.define do
  factory :item do
    name            { 'sample' }
    price           { 5000 }
    explanation     { '商品です' }
    category_id     { 2 }
    condition_id    { 2 }
    delivery_fee_id { 2 }
    prefecture_id   { 2 }
    day_id          { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
    association :user
  end
end
