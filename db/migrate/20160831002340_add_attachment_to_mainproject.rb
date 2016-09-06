class AddAttachmentToMainproject < ActiveRecord::Migration
  def change
    add_column :mainprojects, :attachment, :string
  end
end
