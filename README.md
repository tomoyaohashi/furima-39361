# テーブル設計(furima)

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| namekana  | string  | null: false |
| birthday  | integer | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| Product     | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| charge      | string     | null: false                    |
| Area        | string     | null: false                    |
| day         | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| number     | integer    | null: false                    |
| effective  | integer    | null: false                    |
| cvc        | integer    | null: false                    |
| postal     | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| Building   | string     |                                |
| phone      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy