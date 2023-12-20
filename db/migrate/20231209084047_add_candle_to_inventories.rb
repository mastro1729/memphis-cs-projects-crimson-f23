class AddCandleToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :candle, foreign_key: true
  end
end
