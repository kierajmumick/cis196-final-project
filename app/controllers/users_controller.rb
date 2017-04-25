class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @post = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    reset_session
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end


  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :username, :password)
  end

end
