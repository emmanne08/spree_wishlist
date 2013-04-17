class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :user
      t.string :name
      t.string :access_hash
      t.boolean :is_private, default: true, null: false
      t.boolean :is_default, default: false, null: false

      t.timestamps
    end
  end
end
