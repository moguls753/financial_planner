# == Schema Information
#
# Table name: fixed_costs
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  rent         :integer
#  electricity  :integer
#  internet     :integer
#  food         :integer
#  mobile       :integer
#  savings_plan :integer
#  misc         :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class FixedCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
