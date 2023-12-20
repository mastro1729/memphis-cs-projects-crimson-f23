class Order < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :payment_detail, optional: true
    has_many :cart_items
    has_many :purchase_histories
end
