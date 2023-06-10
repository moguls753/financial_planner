class ChangeBruttoToBeFloatInEmploymentContract < ActiveRecord::Migration[7.0]
  def change
    change_column :employment_contracts, :brutto, :float
  end
end
