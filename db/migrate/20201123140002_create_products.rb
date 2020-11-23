class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title,     null: false, limit: 64
      t.text :description, null: false, limit: 5000
      t.decimal :price,	   null: false

      t.timestamps
    end
  end
end
