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
| birthday            | date    | null: false               |


### Association

- has_many :items
- has_many :purchases
- has_one :shipping-address


## items テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| goods          | string     | null: false                     |
| price          | integer    | null: false                     |
| category_id    | integer    | null: false                     |
| condition_id   | integer    | null: false                     |
| cost-burden_id | integer    | null: false                     |
| prefectures_id | integer    | null: false                     |
| aim_id         | integer    | null: false                     |
| user           | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :cost-burden_id
- belongs_to_active_hash :prefectures_id
- belongs_to_active_hash :aim_id


## shipping-addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post-code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipality     | string     | null: false                    |
| house-number     | text       | null: false                    |
| building-name    | text       |                                |
| phone-number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase
- belongs_to_active_hash :prefectures_id


## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| mark          | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- has_one :shipping-address
