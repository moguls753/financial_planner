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
class FixedCost < ApplicationRecord
  belongs_to :user

  BUDGET_ATTRIBUTES = [
    "rent",
    "electricity",
    "internet",
    "food",
    "mobile",
    "savings_plan",
    "misc",
  ]

  def as_frontend_json
    {
      Miete: rent,
      Strom: electricity,
      Internet: internet,
      Lebensmittel: food,
      Mobilfunk: mobile,
      Sparplan: savings_plan,
      Verschiedenes: misc,
    }
  end

  def sum
    keys = self.attributes.select { |k,v| !v.nil? }.keys & BUDGET_ATTRIBUTES
    self.attributes.slice(*keys).sum { |k,v| v }
  end
end
