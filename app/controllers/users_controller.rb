class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"

    if verify_recaptcha(model: @user, message: captcha_message)
      @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'

      #recaptcha



      #Docasne
      #@user.activate
      #log_in @user
      #potialto

      redirect_to root_url
    else
      flash.delete(:recaptcha_error)
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
      flash[:success] = 'Name successfully changed.'
      redirect_to user_profile_edit_path
    else
      render 'edit'
    end
  end

  def edit_email
    @user = current_user
    render 'edit_email'
  end

  def update_email
    @user = current_user
    user = User.find_by_email(@user.email)

    if user.authenticate(params[:user][:password])

      user_data = user
      user_data.email = params[:user][:email]

      if user_data.save
        flash[:success] = 'Your E-mail was successfully changed.'
      else
        flash[:danger] = 'Incorrect E-mail type!'
      end

      redirect_to user_email_edit_path
    else
      flash[:danger] = 'Incorrect password!'
      render 'edit_email'
    end
  end

  def edit_password
    @user = current_user
    render 'edit_password'
  end

  def update_password
    @user = current_user
    user = User.find_by_email(@user.email)

    if user.authenticate(params[:user][:password_curr]) &&
        !(params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
      if @user.update(user_params)
        flash[:success] = 'Password successfully changed.'
        redirect_to user_password_edit_path
      else
        flash[:danger] = 'Incorrect password or passwords don\'t match!'
        render 'edit_password'
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
