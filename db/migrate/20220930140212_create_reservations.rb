class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :city
      t.references :room, null: false, foreign_key: true
      # the reservations references user foreign key is the react_user_id from the user table
      t.references :users, foreign_key: { to_table: :users, column: :react_user_id }

      t.timestamps
    end
  end
end
