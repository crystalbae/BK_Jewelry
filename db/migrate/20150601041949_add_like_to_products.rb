class AddLikeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :like, :integer, :default => 0
  end
end
