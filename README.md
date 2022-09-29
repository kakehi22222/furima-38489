# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| first-name          | string  | null: false               |
| last-name           | string  | null: false               |
| first-name-japanese | string  | null: false               |
| last-name-japanese  | string  | null: false               |
| birth-year          | integer | null: false               |
| birth-month         | integer | null: false               |
| birth-day           | integer | null: false               |

### Association

- has_many :items
- has_many :purchases
- has_one :shipping-address
- belongs_to_active_hash :birth-year
- belongs_to_active_hash :birth-month
- belongs_to_active_hash :birth-day

## items テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| goods       | string     | null: false                     |
| price       | integer    | null: false                     |
| seller      | string     | null: false                     |
| condition   | integer    | null: false                     |
| cost-burden | integer    | null: false                     |
| area        | integer    | null: false                     |
| aim         | integer    | null: false                     |
| user        | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase
- has_one :shipping-addresses
- belongs_to_active_hash :condition
- belongs_to_active_hash :cost-burden
- belongs_to_active_hash :area
- belongs_to_active_hash :aim


## shipping-addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post-code     | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| house-number  | text       | null: false                    |
| building-name | text       |                                |
| phone-number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase
- belongs_to_active_hash :prefectures


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| mark          | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping-address
