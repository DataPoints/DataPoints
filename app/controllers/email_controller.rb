class EmailController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:info] = "hahah"
      redirect_to user_edit_email_path
    else
      render 'edit'
    end

  end

end