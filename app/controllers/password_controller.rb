class PasswordController < ApplicationController

  def edit
    @user = current_user
  end

end