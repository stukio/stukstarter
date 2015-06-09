class PledgesController < ApplicationController
  	before_action :authenticate_user!
  	before_action :set_project

  	def index
  		@pledges = @project.pledges
  	end

  	def new
  		@pledge = current_user.pledges.build
  		@rewards = @project.rewards
  		respond_to do |format|
	      format.html
	    end
  	end

  	def show
  	end

  	private
  	
  	def set_project
		@project = Project.find(params[:project_id])
	end
end
