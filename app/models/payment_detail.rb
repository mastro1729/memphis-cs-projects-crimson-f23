# == Schema Information
#
# Table name: payment_details
#
#  id         :bigint           not null, primary key
#  card_no    :string
#  card_type  :string
#  cvv        :string
#  exp        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PaymentDetail < ApplicationRecord
  validates :card_no, presence: true, length: { is: 16 }
  validates :card_type, presence: true, inclusion: { in: %w(Visa Mastercard AmericanExpress), message: "is not a valid card type" }
  validates :exp, presence: true
  validates :cvv, presence: true, length: { minimum: 3, maximum: 4 }
  
  validate :expiration_date_must_be_future

  belongs_to :customer, optional: true
  has_one :order

  validates :card_no, uniqueness: { scope: :customer_id, message: "has already been taken for this customer" }

  def expiration_date_must_be_future
    return if exp.blank?
  
    if exp < Date.today
      errors.add(:exp, "must be a future date")
    end
  end

  before_destroy :clean_up_associated_records

  def clean_up_associated_records
    nullify_orders
  end

  def nullify_orders
    orders = Order.where(payment_detail_id: id)
    orders.each { |order| order.update(payment_detail_id: nil) }
  end
end