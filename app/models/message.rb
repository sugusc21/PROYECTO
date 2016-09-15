class Message < ActiveRecord::Base
  belongs_to :mainproject


def self.sendmail
	milestones = Milestone.where(duedate: Date.today + 1.days)
	milestones.each do |mil|
		@mail = mil.user.email	
		MessageMailer.mailmess(@mail).deliver_now
	end

	end 
end