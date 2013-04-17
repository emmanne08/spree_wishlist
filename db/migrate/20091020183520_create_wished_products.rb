class CreateWishedProducts < ActiveRecord::Migration
  def change
    create_table :wished_products do |t|
      t.references :variant
      t.references :wishlist
      t.text :remark

      t.timestamps
    end
  end
end
