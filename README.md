
## usersテーブル

|Column               |Type  |Options    |

|---------------------|------|-----------|

|id                   |int   |null: false|
|nickname             |string|null: false|
|email                |string|null: false|
|password             |string|null: false|
|password_confirmation|string|null: false|
|first_name           |string|null: false|
|last_name            |string|null: false|
|first_name_kana      |string|null: false|
|last_name_kana       |string|null: false|
|birth_date           |date  |null: false|



### Association

- has_many :items
- has_many :orders







## itemsテーブル

|Column      |Type  |Options    |

|------------|------|------------------------------|

|id          |int   |null: false                   |
|user_id     |int   |null: false, foreign_key: true|
|name        |string|null: false                   |
|description |text  |null: false                   |
|category_id |int   |null: false                   |
|status_id   |int   |null: false                   |
|burde_id    |int   |null: false                   |
|area_id     |int   |null: false                   |
|day_id      |int   |null: false                   |
|price       |int   |null: false                   |




### Association

- belongs_to :user
- has_many :orders

## ordersテーブル

|Column  |Type  |Options                       |

|--------|------|------------------------------|

|id      |int   |null: false                   |
|user_id |int   |null: false, foreign_key: true|
|item_id |int   |null: false, foreign_key: true|




### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

|Column      |Type  |Options    |

|--------------|------|------------------------------|

|order_id      |int   |null: false, foreign_key: true|
|post_code     |string|null: false                   |
|prefecture_id |int   |null: false                   |
|city          |string|null: false                   |
|address       |string|null: false                   |
|building_name |string|null: false                   |
|phone_number  |string|null: false                   |




### Association

- belongs_to :order

