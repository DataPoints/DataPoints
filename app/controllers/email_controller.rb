class EmailController < ApplicationController

  def edit
    @user = current_user
  end

  def update

    @user = current_user
    user = User.find_by_email(@user.email)

    if user.authenticate(params[:user][:password])

      c = user
      c.email = params[:user][:email]
      c.save

      flash[:success] = 'Your Email was changed successfuly.'

      redirect_to user_edit_email_path
    else
      flash[:danger] = 'Incorrect password!'
      render 'edit'
    end

  end

end