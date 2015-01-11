class AddProductIdToAsks < ActiveRecord::Migration
  def change
    add_column :asks, :product_id, :integer
  end
end
