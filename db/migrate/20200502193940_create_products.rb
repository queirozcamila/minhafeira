class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :shop, null: false, foreign_key: true
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
