class PhaseController < ApplicationController

	def index
		@phase = Phase.all
		session[:fetched_record] = []
	end

	#get_rendom_phase_path
	def get_rendom_phase
		if (Phase.ids).all? { |e| session[:fetched_record].include?(e) }
			 @message = "No more element in DB!"
		else
			id  = unique_id(Phase.get_rand_id)
			@phase = Phase.find_by_id id
		end
	end

	private
		def unique_id id 
			return if (Phase.ids).all? { |e| session[:fetched_record].include?(e) }
			if !(session[:fetched_record].include?(id)) && id > 0
				session[:fetched_record] << id
				return id
			else
				unique_id(Phase.get_rand_id)
			end
		end

end