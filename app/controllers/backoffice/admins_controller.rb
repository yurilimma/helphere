class Backoffice::AdminsController < BackofficeController

  before_action :set_admin, only: [:edit, :update, :destroy]
  
  #verifica se as policys foram executadas, caso não tenha sido feita abenda
  after_action :verify_authorized, only: :new
  after_action :verify_policy_scoped, only: :index

  def index
    #@admins = Admin.all
    @admins = policy_scope(Admin) #chama o scope de admin_policy
  end

  def new
  	@admin = Admin.new

    / chama o pundit passando o current admin/
    authorize @admin
  end

  def edit
  
  end

  def update

    @usr = params[:admin][:email]

    if @user != @admin.email	
    	if @admin.update(params_admin)
        AdminMailer.update_email(current_admin, @admin).deliver_now
    		redirect_to backoffice_admins_path, notice: I18n.t('messages.updated_with', item: @admin.email ) 
    	else
    		render :edit
    	end
    else
      render :edit
    end

  end

  def create
  	@admin = Admin.new(params_admin)
  	if @admin.save 
  		redirect_to backoffice_admins_path, notice: I18n.t('messages.created_with', item: @admin.email )
  	else
  		render :new
  	end
  end

  def destroy
    admin_name = @admin.name
    authorize @admin

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: I18n.t('messages.destroyed')
    else
      render :index
    end
  end


  private
  def params_admin

    pwd = params[:admin][:password]
    pwd_confirmation = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    if @admin.blank?
  	 params.require(:admin).permit(:name,:email,:role,:password,:password_confirmation)
    else
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end


 
  end

  def set_admin
  	@admin = Admin.find(params[:id])
  end

end

