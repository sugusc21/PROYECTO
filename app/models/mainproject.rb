class Mainproject < ActiveRecord::Base
  belongs_to :user
  has_many :milestones
  has_many :messages
  mount_uploader :attachment, ProjectUploader
end
