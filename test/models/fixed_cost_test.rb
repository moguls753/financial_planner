# == Schema Information
#
# Table name: fixed_costs
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  rent         :integer          default(0)
#  electricity  :integer          default(0)
#  internet     :integer          default(0)
#  food         :integer          default(0)
#  mobile       :integer          default(0)
#  savings_plan :integer          default(0)
#  misc         :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class FixedCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
