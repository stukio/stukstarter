class Reward < ActiveRecord::Base
	belongs_to :project
	has_many :pledges
	has_many :backers, through: :pledges, source: :user

	validates :description, :value, :estimated_delivery, presence: true
	validates :value, numericality: { greater_than_or_equal_to: 0 }
	validates :number_available, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
	validates :estimated_delivery, date: { after: Date.today }
end
