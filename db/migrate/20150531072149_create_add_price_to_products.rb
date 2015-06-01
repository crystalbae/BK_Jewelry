class CreateAddPriceToProducts < ActiveRecord::Migration
  def change
    create_table :add_price_to_products do |t|

      t.timestamps
    end
  end
end
