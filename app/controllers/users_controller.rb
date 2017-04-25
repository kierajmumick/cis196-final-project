class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @users = User.all
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]

    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /users/1
  def update
    if logged_in?
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to login_path
    end
  end

  # DELETE /users/1
  def destroy
    if logged_in?
      @user.destroy
      reset_session
      redirect_to users_url, notice: 'User was successfully destroyed.'
    else
      redirect_to login_path
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
