class ClosetItem < ApplicationRecord
  belongs_to :item
  belongs_to :closet
  has_many :tags
  belongs_to :user

end
