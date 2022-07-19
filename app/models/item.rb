class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :burde
    belongs_to_active_hash :area
    belongs_to_active_hash :day
end
