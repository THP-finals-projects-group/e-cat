class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_name,   null: false
      t.string :street_number, null: false
      t.string :zip_code,      null: false
      t.string :city,          null: false
      t.string :country,       null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
