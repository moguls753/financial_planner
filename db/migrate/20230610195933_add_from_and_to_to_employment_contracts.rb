class AddFromAndToToEmploymentContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_contracts, :from, :date
    add_column :employment_contracts, :to, :date
  end
end
