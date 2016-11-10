class CreateClosets < ActiveRecord::Migration[5.0]
  def change
    create_table :closets do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
