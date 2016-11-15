class Item < ApplicationRecord
  has_many :closet_items
  has_many :closets, through: :closet_items
  has_many :users, through: :closet_items

  validates :designer, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, :designer

  def closet_items_attributes=(attributes)
    attributes.values.each do |attr|
      self.closet_items.build(attr)
    end
  end


end
