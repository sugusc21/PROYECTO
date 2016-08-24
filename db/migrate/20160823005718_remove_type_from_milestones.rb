class RemoveTypeFromMilestones < ActiveRecord::Migration
  def change
    remove_column :milestones, :type, :string
  end
end
