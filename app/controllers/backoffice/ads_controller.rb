class Backoffice::AdsController < BackofficeController

	def index
	 @ads = Ad.order(:finish_date).page(params[:page]).per(6)
	end
end
