class AddCustomerToPaymentDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :payment_details, :customer, foreign_key: true
  end
end
