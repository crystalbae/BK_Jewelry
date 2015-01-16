class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :title
      t.text :content
      t.string :writer
      t.string :email

      t.timestamps
    end
  end
end
