class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.string :title
      t.text :content
      t.string :writer
      t.string :model

      t.timestamps
    end
  end
end
