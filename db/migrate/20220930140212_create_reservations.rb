class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :city
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
