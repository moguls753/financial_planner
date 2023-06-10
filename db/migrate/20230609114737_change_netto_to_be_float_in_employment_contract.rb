class ChangeNettoToBeFloatInEmploymentContract < ActiveRecord::Migration[7.0]
  def change
    change_column :employment_contracts, :netto, :float
  end
end
