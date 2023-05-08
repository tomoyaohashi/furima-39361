# テーブル設計(furima)

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| surname             | string | null: false               |
| name                | string | null: false               |
| surnamekana         | string | null: false               |
| namekana            | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :buys
- has_many :historys

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| charge_id    | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy
- has_one :history

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy
- has_one :history

## historys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy