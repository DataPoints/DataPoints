class UsersController < ApplicationController
  before_action 'logged_in_user', except: [:new, :create]
  before_action :correct_user, except: [:new, :create]

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
      DatasetFactory.new.delay.firstDataset(@user.id)
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

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:psw] == 'true'
      if @user.authenticate(params[:user][:old_password])
        if @user.update(user_params)
          flash[:success] = 'Profil uspesne zmeneny.'
          redirect_to edit_user_path
        else
          render 'edit'
        end
      else
        @user.errors.add(:base, "Change password zle heslo")
        render 'edit'
      end
    else
      if @user.authenticate(params[:user][:password])
        if @user.update(user_params)
          flash[:success] = 'Profil uspesne zmeneny.'
          redirect_to edit_user_path
        else
          render 'edit'
        end
      else
        @user.errors.add(:base, "Parametre zle heslo")
        render 'edit'
      end
    end
  end

  def correct_user
    if User.find(params[:id]) != current_user
      flash[:danger] = 'Permission denied.'
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
