class CreateMainprojects < ActiveRecord::Migration
  def change
    create_table :mainprojects do |t|
      t.string :company
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
