# == Schema Information
#
# Table name: candles
#
#  id           :bigint           not null, primary key
#  color        :string
#  description  :text
#  design_style :string
#  fragrance    :string
#  name         :string
#  pet_type     :string
#  price        :integer
#  silhouette   :string
#  size         :string
#  wax_type     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class CandleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
