class PhaseController < ApplicationController

	def index
		@phase = Phase.all
		session[:fetched_record] = []
	end

	#get_rendom_phase_path
	def get_rendom_phase
		if (Phase.ids).all? { |e| session[:fetched_record].include?(e) }
			 errors.add(:name, message: "No more element in db") 
		else
			id  = rand(Phase.count)
			if !(session[:fetched_record].include?(id)) && id > 0
				session[:fetched_record] << id
				@phase = Phase.find_by_id id 
			elsif (session[:fetched_record].include?(id))
				id  = rand(Phase.count)
			end
		end
	end

end
