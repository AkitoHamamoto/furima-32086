# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- |------- | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many  :items
- has_one   :user_info

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| image        |            |                                |
| explanation  | test       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| days         | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- belongs_to :user_info, through: :purchase

## user_info テーブル

| Column          | Type       | Options                        |
| --------------- |----------- | ------------------------------ |
| credit_number   | string     | null: false                    |
| expiration_date | string     | null: false                    |
| csv             | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases
- has_many :items , through: :purchase

## purchase テーブル

| Column       | Type       | Options                        |
| ------------ |----------- | ------------------------------ |
| user_info_id | string     | null: false, foreign_key: true |
| item_id      | string     | null: false, foreign_key: true |

### Association

- belongs_to : user_info
- belongs_to : item
