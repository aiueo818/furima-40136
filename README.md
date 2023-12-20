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

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| nickname   | string     | null: false |
| mail       | string     | null: false |
| password   | string     | null: false |
| birth      | string     | null: false |

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | references | null: false, foreign_key: true |
| text         | string     | null: false                    |
| category     | string     | null: false                    |
| status       | string     | null: false                    |
| postage      | string     | null: false                    |
| address      | references | null: false, foreign_key: true |
| days         | string     | null: false                    |
| price        | string     | null: false                    |

### Association
- has_one :buy

## buyテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| list       | references | null: false, foreign_key: true |


### Association
- belongs_to :items

## addressテーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | string     | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
