class AddAttachmentToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :attachment, :string
  end
end
