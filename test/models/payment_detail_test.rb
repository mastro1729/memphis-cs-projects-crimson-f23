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
require "test_helper"

class PaymentDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
