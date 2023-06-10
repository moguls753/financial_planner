class AddSalaryIntervalToEmploymentContract < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_contracts, :salary_interval, :integer
  end
end
