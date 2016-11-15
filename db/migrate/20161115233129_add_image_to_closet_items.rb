class AddImageToClosetItems < ActiveRecord::Migration[5.0]
  def change
    add_column :closet_items, :image, :string
  end
end
