class ClosetItem < ApplicationRecord
  belongs_to :item
  belongs_to :closet
  has_many :tags
  has_one :user, through: :closet

end
