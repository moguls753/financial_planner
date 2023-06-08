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
class EmploymentContract < ApplicationRecord
  belongs_to :user

  validates :organisation, presence: true
  validates :brutto, presence: true

  # TODO Form Model fehlt noch

  def jahresbrutto
    self.brutto
  end

  def monatsbrutto
    self.brutto/12
  end

  def jahresnetto
    self.netto
  end

  def monatsnetto
    self.netto/12
  end
end
