class Item < ApplicationRecord
  has_many :closet_items
  has_many :closets, through: :closet_items
  has_many :users, through: :closet_items
  accepts_nested_attributes_for :closet_items
end
