class CreateStakeholders < ActiveRecord::Migration
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :jobtitle
      t.string :busarea
      t.references :mainproject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
