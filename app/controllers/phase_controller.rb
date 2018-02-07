class PhaseController < ApplicationController

	def index
		@phase = Phase.all
		session[:fetched_record] = []
	end

	#get_rendom_phase_path
	def get_rendom_phase
		id  = rand(1..10)
		if !(session[:fetched_record].include?(id))
			session[:fetched_record] << id
			@phase = Phase.find_by_id id 
		elsif (1..10).to_a.all? { |e| session[:fetched_record].include?(e) }
			 errors.add(:name, message: "No more element in db") 
		end
	end

end
