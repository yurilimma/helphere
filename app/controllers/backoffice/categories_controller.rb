class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def index
  	@categories = Category.order(:description)
  end

  def new
  	@category = Category.new

  end

  def edit
  
  end

  def destroy

    if @category.destroy
      redirect_to backoffice_categories_path, notice: I18n.t('messages.destroyed')
    else
      render :index
    end
  end


  def update
  	
  	if @category.update(params_category)
  		redirect_to backoffice_categories_path, notice: "A categoria (#{@category.description}) foi atualizada com sucesso"
  	else
  		render :edit
  	end

  end

  def create
    
  	@category = CategoryService.create(params_category)

  	unless @category.errors.any? 
  		redirect_to backoffice_categories_path, notice: "A categoria (#{@category.description}) foi cadastrada com sucesso"
  	else
  		render :new
  	end
  end

  private
  def params_category
  	params.require(:category).permit(:description)
  end

  def set_category
  	@category = Category.friendly.find(params[:id])
  end



end
