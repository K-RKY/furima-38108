# データベース設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first name         | string | null: false |
| family name        | string | null: false |
| birth_day          | date   | null: false |

### Association

* has_many :phone numbers
* has_many :addresses

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | text       | null: false                    |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| price         | integer    | null: false                    |
| postage       | string     | null: false                    |
| shipping area | string     | null: false                    |
| shipping days | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :category
* belongs_to :condition

## addressesテーブル

| Column         | Type    | Options                        |
| -------------- | ------  | ------------------------------ |
| post code      | integer | null: false                    |
| prefecture     | string  | null: false                    |
| municipalities | string  | null: false                    |
| hose number    | string  | null: false                    |
| user_id        | string  | null: false, foreign_key: true |

### Association

* belongs_to :user

## phone numbersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------  | ------------------------------ |
| number         | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

* belongs_to :user

## cardsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------  | ------------------------------ |
| card number    | integer    | null: false                    |
| card expiry    | integer    | null: false                    |
| security code  | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

* belongs_to :user

## conditionsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

* has_many :items

## categoriesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

* has_many :items