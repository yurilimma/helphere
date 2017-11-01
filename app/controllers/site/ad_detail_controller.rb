class Site::AdDetailController < SiteController
	
	def show
		@categories = Category.order_by_description
  		@ads = Ad.descending_order(params[:page])
		@ad = Ad.find(params[:id])
	end
end
