class Milestone < ActiveRecord::Base
  belongs_to :mainproject
  belongs_to :user , foreign_key: 'users_id'
  mount_uploader :attachment, ProjectUploader
end
