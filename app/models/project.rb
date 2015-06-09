# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string
#  short_description :text
#  description       :text
#  image_url         :string
#  status            :string           default("pending")
#  goal              :decimal(8, 2)
#  expiration_date   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ActiveRecord::Base
  	belongs_to :user
  	has_many :rewards

  	validates :name, :short_description, :description, :image_url, :expiration_date, :goal, presence: true
  	before_validation :start_project, :on => :create

  	def pledges
		rewards.flat_map(&:pledges)
	end

  	private

  	def start_project
		self.expiration_date = 1.month.from_now
	end
end
