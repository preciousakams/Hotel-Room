class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.string :view
      t.string :bedding
      t.string :image

      t.timestamps
    end
  end
end
