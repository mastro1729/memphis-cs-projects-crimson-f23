class CreateCandles < ActiveRecord::Migration[7.0]
  def change
    create_table :candles do |t|
      t.string :name
      t.text :description
      t.string :color
      t.string :size
      t.string :fragrance
      t.string :wax_type
      t.string :pet_type
      t.string :silhouette
      t.string :design_style
      t.integer :price

      t.timestamps
    end
  end
end
