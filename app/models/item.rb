class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :shipping_days
  has_one_attached :image

  validates :name, :image, :text, presence: true
  validates :price, presence: true, format: {with:/\A[-]?[0-9]+(\.[0-9]+)?\z/}, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 1 }
end
