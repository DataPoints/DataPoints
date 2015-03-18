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
    @users = User.page(params[:page]).per(5)
  end

  def destroy
    begin
      @user = User.find(params[:id])
      unless @user.id == @current_user.id
        logger.info "Deleting user: " + @user.name
        @user.destroy
      else
        logger.warn "User tried to delete self via admin panel"
      end
    rescue ActiveRecord::RecordNotFound  => e
    ensure
      redirect_to url_for(:controller => 'admin/dashboard', :action => 'index')
    end
  end

end