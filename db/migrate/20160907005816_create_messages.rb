class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :description
      t.string :messtype
      t.text :receivers
      t.references :mainproject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
