class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category
      t.string :name
      t.string :explanation
      t.string :image

      t.timestamps
    end
  end
end
