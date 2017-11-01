class Site::Profile::DashboardController < Site::ProfileController
	def index
		@ads = Ad.to_the(current_member)
		@size = Ad.all.count.to_f * (@ads.count.to_f / 100 ) 
		@size2 = (((@ads.count.to_f / 100 ) * 100)/ Ad.all.count.to_f) * 100
		if(@size2 == 100.00)
			@size2 = 99
		else
			@size2 = 4
		end
	end

	
	
end
