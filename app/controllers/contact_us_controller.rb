class ContactUsController < ApplicationController
  def new
  @contact_us = ContactUs.new(:id => 1)
  end

  def create
    captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
    @contact_us = ContactUs.new(params[:contact_us])
    @contact_us.valid?


    if verify_recaptcha(model: @contact_us, message: captcha_message)
      @contact_us.save
      flash[:info] = "Your ticket was successfully sent. Our trained monkeys will contact you in the foreseeable future."
      redirect_to contact_us_path
    else
      flash.delete(:recaptcha_error)
      render 'new'
    end

  end

end
