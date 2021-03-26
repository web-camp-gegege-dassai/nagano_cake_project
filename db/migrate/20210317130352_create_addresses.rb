class Adresses < ActiveRecord::Migration[5.0]
  def change
    create_table "addresses", force: :cascade do |t|
      t.integer "customer_id"
      t.string "name"
      t.string "postal_code"
      t.string "address"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      
      t.timestamps
    end
  end
end
