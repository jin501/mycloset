class Tag < ApplicationRecord
  has_many :closet_items
  validates :tag, presence: true
end
