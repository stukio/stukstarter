class ChargeBackersJob < ActiveJob::Base
  queue_as :default

  def perform(project_id)
    @project = Project.find(project_id)
  	if @project.funded?
  		@project.pledges.each do |pledge|
  			pledge.charge! unless pledge.charged?
  		end
  	else
  		@project.expired!
  	end
  end
end
