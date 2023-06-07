class CreateFixedCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_costs do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :rent, default: 0
      t.integer :electricity, default: 0
      t.integer :internet, default: 0
      t.integer :food, default: 0
      t.integer :mobile, default: 0
      t.integer :savings_plan, default: 0
      t.integer :misc, default: 0

      t.timestamps
    end
  end
end
