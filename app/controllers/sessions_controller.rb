class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
  
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Successfully logged in as #{user.first_name}"
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    else
      flash.now[:alert] = 'User not found'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out successfully!'
  end
end