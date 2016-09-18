class Mainproject < ActiveRecord::Base
  belongs_to :user
  has_many :milestones
  has_many :messages
  has_many :stakeholders
  mount_uploader :attachment, ProjectUploader
end
