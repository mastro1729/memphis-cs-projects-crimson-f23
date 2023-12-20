class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :order_reward
      t.boolean :is_payment_done

      t.timestamps
    end
  end
end
