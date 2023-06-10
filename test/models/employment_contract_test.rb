# == Schema Information
#
# Table name: employment_contracts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  brutto          :float
#  netto           :float
#  organisation    :string
#  vacation        :integer
#  working_hours   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  salary_interval :integer
#  active          :boolean
#  from            :date
#  to              :date
#
require "test_helper"

class EmploymentContractTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
