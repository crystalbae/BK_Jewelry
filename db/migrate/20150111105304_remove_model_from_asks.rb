class RemoveModelFromAsks < ActiveRecord::Migration
  def change
    remove_column :asks, :model, :string
  end
end
