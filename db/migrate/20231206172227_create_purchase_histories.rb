class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.string :candle_name
      t.string :candle_desc
      t.string :candle_pet_type
      t.integer :candle_price
      t.integer :candle_quantity
      t.string :payment_card_no
      t.string :payment_card_type

      t.timestamps
    end
  end
end
