class PasswordController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user = User.find_by_email(@user.email)

    if user.authenticate(params[:user][:password_curr])
      if (params[:user][:password].blank? || params[:user][:password_confirmation].blank?)
        flash.now[:danger] = "New password and Password confirmation fields can't be blank."
        render 'edit'
      elsif @user.update(user_params)
        flash[:success] = "Password successfuly changed."
        redirect_to user_edit_password_path
      else
        render 'edit'
      end
    else
      flash[:danger] = 'Incorrect password!'
      render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end