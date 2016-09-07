class Milestone < ActiveRecord::Base
  belongs_to :mainproject
  belongs_to :user
end
