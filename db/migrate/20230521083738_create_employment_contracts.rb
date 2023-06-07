class CreateEmploymentContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_contracts do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :brutto
      t.integer :netto
      t.string :organisation
      t.integer :vacation
      t.integer :working_hours

      t.timestamps
    end
  end
end
