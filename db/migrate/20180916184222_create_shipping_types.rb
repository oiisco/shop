class CreateShippingTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_types do |t|
      t.string :name
      t.integer :cost

      t.timestamps
    end
  end
end
