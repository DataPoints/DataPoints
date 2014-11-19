class PasswordController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user = User.find_by_email(@user.email)
    danger_msg = 'Incorrect password or passwords don\'t match!'

    if user.authenticate(params[:user][:password_curr])
      if (params[:user][:password].blank? || params[:user][:password_confirmation].blank?)
        flash.now[:danger] = danger_msg
        render 'edit'
      elsif @user.update(user_params)
        flash[:success] = "Password successfuly changed."
        redirect_to user_edit_password_path
      else
        flash[:danger] = danger_msg
        render 'edit'
      end
    else
      flash[:danger] = danger_msg
      render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end