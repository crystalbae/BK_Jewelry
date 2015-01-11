class AddEmailToAsks < ActiveRecord::Migration
  def change
    add_column :asks, :email, :string
  end
end
