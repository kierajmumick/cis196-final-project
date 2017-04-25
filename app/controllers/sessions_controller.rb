class SessionsController < ApplicationController
  include BCrypt
  def new
  end

  def create
  	@user = User.find_by username: params[:username]
    if @user.nil?
      redirect_to login_path
    else
    	if @user.password == params[:password]
    		session[:user_id] = @user.id
    		redirect_to root_path
    	else
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
