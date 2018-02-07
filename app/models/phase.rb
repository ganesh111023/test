class Phase < ActiveRecord::Base

	def self.get_rand_id
		rand(1..10)
	end


end
