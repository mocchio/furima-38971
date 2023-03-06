class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :day_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true

  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true
end
