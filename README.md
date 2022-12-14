# データベース設計

## usersテーブル

| Column                  | Type   | Options                   |
| ----------------------- | ------ | ------------------------- |
| nickname                | string | null: false               |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| first_name              | string | null: false               |
| first_name_kana         | string | null: false               |
| family_name             | string | null: false               |
| family_name_kana        | string | null: false               |
| birth_day               | date   | null: false               |

### Association

* has_many :orders
* has_many :items

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_one :order

## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| house_name          | string     |
| phone_number        | string     | null:false                     | 
| order     | references | null: false, foreign_key: true |

### Association

* belongs_to :order

## ordersテーブル

| Column  | Type       | Options                       |
| ------- | ---------  | ----------------------------- |
| user    | references | null:false, foreign_key: true |
| item    | references | null:false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :address