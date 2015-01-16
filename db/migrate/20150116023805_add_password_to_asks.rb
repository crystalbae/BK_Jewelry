class AddPasswordToAsks < ActiveRecord::Migration
  def change
    add_column :asks, :password, :string
  end
end
