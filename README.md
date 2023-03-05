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
| date_of_birth        | date     | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル(商品情報)

| Column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | null: false                     |
| explanation        | text       | null: false                     |
| category_id        | integer    | null: false                     |
| status_id          | integer    | null: false                     |
| delivery_charge_id | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| day_to_ship_id     | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order


## orders テーブル(購入記録)

| Column    | Type        | Option                           |
| --------- | ----------- | -------------------------------- |
| user      | references  | null: false, foreign_key: true   |
| item      | references  | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル(発送先情報)

| Column            | Type        | Option                         |
| ----------------- | ----------- | ------------------------------ |
| post_code         | string      | null: false                    |
| prefecture_id     | integer     | null: false                    |
| municipalities    | string      | null: false                    |
| address           | string      | null: false                    |
| building_name     | string      |                                |
| telephone_number  | string      | null: false                    |
| order             | references  | null: false, foreign_key: true |

### Association

- belongs_to :order