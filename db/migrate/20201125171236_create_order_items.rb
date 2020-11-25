class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer    :quantity, default: 1

      t.timestamps
    end
  end
end
