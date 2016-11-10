class Item < ApplicationRecord
  has_many :closet_items
  has_many :closets, through: :closet_items
  has_many :users, through: :closet_items
end
