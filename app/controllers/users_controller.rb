class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"

    if @user.save && verify_recaptcha(model: @user, message: captcha_message)
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'

      #recaptcha



      #Docasne
      #@user.activate
      #log_in @user
      #potialto

      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = 'Name successfuly changed.'
      redirect_to user_edit_profile_path
    else
     render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
