class AddCandleReferenceToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :candle, foreign_key: true
  end
end
