class Item < ApplicationRecord
  has_many :closet_items
  has_many :closets, through: :closet_items
  has_many :users, through: :closet_items
  # accepts_nested_attributes_for :closet_items
  # accepts_nested_attributes_for :closets

  def closet_items_attributes=(attributes)
    attributes.values.each do |attr|
      self.closet_items.build(attr)
    end
  end


end
