class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.string :card_no
      t.string :card_type
      t.date :exp
      t.string :cvv

      t.timestamps
    end
  end
end
