class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :cart, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.belongs_to :order, index: true
      t.integer    :quantity, default: 1

      t.timestamps
    end
  end
end
