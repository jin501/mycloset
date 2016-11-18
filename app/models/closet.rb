class Closet < ApplicationRecord
  belongs_to :user
  has_many :closet_items
  has_many :items, through: :closet_items

end
