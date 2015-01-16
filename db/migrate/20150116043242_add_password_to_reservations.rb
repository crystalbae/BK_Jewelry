class AddPasswordToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :password, :string
  end
end
