class AddActiveToEmploymentContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_contracts, :active, :boolean
  end
end
