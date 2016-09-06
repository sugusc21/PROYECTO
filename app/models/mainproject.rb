class Mainproject < ActiveRecord::Base
  belongs_to :user
  has_many :milestones
  mount_uploader :attachment, ProjectUploader
end
