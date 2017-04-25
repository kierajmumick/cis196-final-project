class SessionsController < ApplicationController
  include BCrypt
  def new
  end

  def create
  	@user = User.find_by username: params[:username]
    p "password: #{params[:password]}"
    p "expected: #{@user.password}"

  	if @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
