class AddProjtypeToMilestones < ActiveRecord::Migration
  def change
    add_column :milestones, :projtype, :string
  end
end
