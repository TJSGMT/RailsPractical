class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.find_by(Username: params[:Username])
    if @user.present? && @user.authenticate(params[:password])  
      session[:user_id] = @user.id
      redirect_to events_path, notice:"Logged in successfully"
    else
      flash.now[:alert] = 'Invalid Emails Or Password'
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
