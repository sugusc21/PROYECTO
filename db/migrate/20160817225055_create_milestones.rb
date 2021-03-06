class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :milestone
      t.string :type
      t.date :duedate
      t.references :mainproject, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
