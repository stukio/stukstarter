class PaymentsController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_project
	before_action :set_reward
  	before_action :set_amount

  	def new
  	end

  	def create
  	end

  	private

  	def set_project
	    @project = Project.find(params[:project_id])
	end

	def set_amount
		@amount = payment_params[:amount].to_i
	end

	def set_reward		
	    @reward = @project.rewards.find_by_id(payment_params[:reward_id])
	end

	def payment_params
		params.require(:pledge).permit(:reward_id, :name, :amount, :address, :city, :country, :postal_code)
	end
end
