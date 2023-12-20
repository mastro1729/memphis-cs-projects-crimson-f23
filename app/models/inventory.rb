class Inventory < ApplicationRecord
    belongs_to :vendor, optional: true
    belongs_to :candle, optional: true
end
