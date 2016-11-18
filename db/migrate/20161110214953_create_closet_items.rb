class CreateClosetItems < ActiveRecord::Migration[5.0]
  def change
    create_table :closet_items do |t|
      t.integer :closet_id
      t.integer :item_id
      t.string :comment
      t.string :note
      t.integer :quantity
      t.string :size
      t.datetime :last_worn
      t.string :status
      t.datetime :bought
      t.string :season
      t.integer :tag_id
      t.string :image

      t.timestamps
    end
  end
end
