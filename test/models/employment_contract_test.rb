# == Schema Information
#
# Table name: employment_contracts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  brutto        :integer
#  netto         :integer
#  organisation  :string
#  vacation      :integer
#  working_hours :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class EmploymentContractTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
