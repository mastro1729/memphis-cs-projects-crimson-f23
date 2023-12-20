class AddOrderToPurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchase_histories, :order, foreign_key: true
  end
end
