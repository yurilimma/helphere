class AdminPolicy < ApplicationPolicy
  

  def new?
  	user.full_access?
  end
  def edit?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      [:name,:email,:role,:password,:password_confirmation]
    else
      [:name,:email,:password,:password_confirmation]
    end
  end
  
  def destroy?
  	user.full_access?
  end

  class Scope < Scope
    def resolve
    	if user.full_access?
			scope.all
		else
			scope.where(email: user.email)
		end
    end
  end
end
