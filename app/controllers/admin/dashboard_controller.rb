class Admin::AdminController < ApplicationController
	include SessionsHelper

	before_action :require_admin_authorization

	private def require_admin_authorization
	    unless current_user.isAdmin
	      flash[:error] = "You must have admin rights"
	      redirect_to root_path# halts request cycle
	    end
	end
end

class Admin::DashboardController < Admin::AdminController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
  	 @users = User.page(1)
  	 @datasets = Dataset.page(params[:page]).per(5) 
  end

  def deleteUser
  	 userToBeDeleted = User.find(params[:id])
  	 puts user.name
  	 redirect_to dashboard_path
  end

end