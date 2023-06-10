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
class EmploymentContract < ApplicationRecord
  belongs_to :user

  validates :organisation, presence: true
  validates :brutto, presence: true
  validates :salary_interval, presence: true
  validates :active, presence: true

  enum salary_interval: [:yearly, :monthly, :hourly]

  def yearly_brutto_salary
    case salary_interval
    when "yearly"
      brutto
    when "monthly"
      brutto*12
    when "hourly"
      if vacation.present? && working_hours.present?
        brutto*working_hours*(230-vacation)
      elsif working_hours.present?
        brutto*working_hours*(230)
      end
    end
  end

  def yearly_netto_salary
    case salary_interval
    when "yearly"
      netto
    when "monthly"
      netto*12
    when "hourly"
      if vacation.present? && working_hours.present?
        netto*working_hours*(230-vacation)
      elsif working_hours.present?
        netto*working_hours*(230)
      end
    end
  end

  def monthly_brutto_salary
    case salary_interval
    when "yearly"
      brutto/12
    when "monthly"
      brutto
    when "hourly"
      if vacation.present? && working_hours.present?
        (brutto*working_hours*(230-vacation))/12
      elsif working_hours.present?
        (brutto*working_hours*(230))/12
      end
    end
  end

  def monthly_netto_salary
    case salary_interval
    when "yearly"
      netto/12
    when "monthly"
      netto
    when "hourly"
      if vacation.present? && working_hours.present?
        (netto*working_hours*(230-vacation))/12
      elsif working_hours.present?
        (netto*working_hours*(230))/12
      end
    end
  end
end
