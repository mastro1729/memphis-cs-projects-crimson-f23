class AddCustomerToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :customer, foreign_key: true
  end
end
