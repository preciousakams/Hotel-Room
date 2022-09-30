class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :react_user_id
      
      t.timestamps
    end
  end
end
