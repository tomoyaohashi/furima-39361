class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :postal_id,      null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building
      t.string :phone,          null: false
      t.references :history,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
