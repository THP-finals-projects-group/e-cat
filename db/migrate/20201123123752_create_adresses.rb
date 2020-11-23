class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street_number,  null: false
      t.string :street_name,    null: false
      t.string :zipcode,        null: false
      t.string :city,           null: false
      t.string :country,        null: false

      t.timestamps
    end
  end
end
