# == Schema Information
#
# Table name: cart_items
#
#  id          :bigint           not null, primary key
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  candle_id   :bigint
#  customer_id :bigint
#
# Indexes
#
#  index_cart_items_on_candle_id    (candle_id)
#  index_cart_items_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (candle_id => candles.id)
#  fk_rails_...  (customer_id => customers.id)
#
class CartItem < ApplicationRecord
    belongs_to :candle
    belongs_to :customer, optional: true
    belongs_to :order, optional: true
end
