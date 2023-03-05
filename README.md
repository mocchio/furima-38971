# テーブル設計


## users テーブル(ユーザー情報)

| Column               | Type     | Option                    |
| -------------------- | -------- | ------------------------- |
| email                | string   | null: false, unique: true |
| encrypted_password   | string   | null: false               |
| nickname             | string   | null: false               |
| name_last            | string   | null: false               |
| name_first           | string   | null: false               |
| name_last_kana       | string   | null: false               |
| name_first_ kana     | string   | null: false               |
| year_of_birth        | integer  | null: false               |
| month_of_ birth      | integer  | null: false               |
| day_of_birth         | integer  | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル(商品情報)

| Column           | Type       | Option                          |
| ---------------- | ---------- | ------------------------------- |
| title            | string     | null: false                     |
| explanation      | text       | null: false                     |
| category         | string     | null: false                     |
| status           | string     | null: false                     |
| delivery_charge  | string     | null: false                     |
| shipping_area    | string     | null: false                     |
| day_to_ship      | string     | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order


## order テーブル(購入記録)

| Column    | Type        | Option                           |
| --------- | ----------- | -------------------------------- |
| buyer     | references  | null: false, foreign_key: true   |
| item      | references  | null: false, foreign_key: true   |
| seller    | references  | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_many :shipping_addresses


## shipping_addresses テーブル(発送先情報)

| Column            | Type        | Option                         |
| ----------------- | ----------- | ------------------------------ |
| post_code         | integer     | null: false                    |
| prefectures       | string      | null: false                    |
| municipalities    | string      | null: false                    |
| address           | string      | null: false                    |
| building_name     | string      | null: false                    |
| telephone_number  | integer     | null: false                    |
| buyer             | references  | null: false, foreign_key: true |
| item              | references  | null: false, foreign_key: true |
| seller            | references  | null: false, foreign_key: true |

### Association

- belongs_to :order