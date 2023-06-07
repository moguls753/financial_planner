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
class FixedCost < ApplicationRecord
  belongs_to :user

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
end
