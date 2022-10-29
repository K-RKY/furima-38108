class Item < ApplicationRecord
  belongs_to :user

  validates :name, :text, :postage_id, :category_id
            :shipping_area_id, :shipping_days_id, :condition_id
            :user_id, presence: true
  validates :price, presence: true, format: {with:/\A[-]?[0-9]+(\.[0-9]+)?\z/},
            :greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
end
