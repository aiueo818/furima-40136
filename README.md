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


## usersテーブル

| Column                     | Type       | Options                   |
| -------------------------- | ---------- | ------------------------- |
| nickname                   | string     | null: false               |
| email                      | string     | null: false, unique: true |
| encrypted_password         | string     | null: false               |
| birth                      | date       | null: false               |
| last_name                  | string     | null: false               |
| first_name                 | string     | null: false               |
| last_name_reading          | string     | null: false               |
| first_name_reading         | string     | null: false               |
| buy_id                     | string     | null: false               |

### Association
- has_many :items
- has_many :buys

## itemsテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| explanation       | string     | null: false |
| category_id       | integer    | null: false |
| status_id         | integer    | null: false |
| postage_id        | integer    | null: false |
| address_id        | integer    | null: false |
| number_of_days_id | integer    | null: false |
| price             | integer    | null: false |

### Association
- has_one :buys
- belongs_to :users

## buysテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| post_code      | string     | null: false       |
| address_id     | string     | null: false       |
| city           | string     | null: false       |
| street_address | string     | null: false       |
| building       | string     | foreign_key: true |
| phone_number   | string     | null: false       |
| card           | string     | null: false       |

### Association
- belongs_to :users
