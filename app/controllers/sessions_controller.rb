class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Log in user and redirect to user profile page
      log_in user
      redirect_to user
    else
      # Create and error message
      flash.now[:danger] = 'Invalid email/password confirmation'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other 
  end
end