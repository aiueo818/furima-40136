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

### Association
- has_many :items
- has_many :buy

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| explanation       | string     | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| postage_id        | integer    | null: false, foreign_key: true |
| address_id        | integer    | null: false, foreign_key: true |
| number_of_days_id | integer    | null: false, foreign_key: true |
| price             | integer    | null: false, foreign_key: true |

### Association
- has_one :buy
- has_many :users
- belongs_to :buy

## buyテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| users      | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |


### Association
- belongs_to :address

## addressテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| address_id     | string     | null: false                    |
| city           | string     | null: false, foreign_key: true |
| street_address | string     | null: false, foreign_key: true |
| building       | string     | foreign_key: true              |
| phone_number   | string     | null: false, foreign_key: true |
