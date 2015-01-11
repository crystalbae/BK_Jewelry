class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :writer
      t.string :email
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
