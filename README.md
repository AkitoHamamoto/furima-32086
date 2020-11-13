# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- |------- | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| kana_first_name | string | null: false |
| kana_last_name  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many  :items
- has_one   :user_info
- has_many  :purchases, through: :uer_info

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| image           |            |                                |
| explanation     | test       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- has_one :user_info, through: :purchase

## user_info テーブル

| Column         | Type       | Options                        |
| -------------- |----------- | ------------------------------ |
| postal_code_id | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address_line   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :item, through: :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user, through: :user_info
- has_one :item
- belongs_to :user_info