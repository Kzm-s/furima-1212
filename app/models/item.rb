class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :user
    has_one_attached :image
    has_one :order
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :burde
    belongs_to_active_hash :area
    belongs_to_active_hash :day

    with_options presence: true do
        validates :name, :description, :image

        with_options numericality: { other_than: 1 } do
            validates :category_id, :status_id, :burde_id, :area_id, :day_id
        end

        with_options format: { with: /\A[0-9]+\z/ } do
            validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
        end
    end
end
