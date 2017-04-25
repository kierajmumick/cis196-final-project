class PostsController < ApplicationController

  def index
    if logged_in?
      @posts = Post.all
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @post = Post.create post_params
      @post.user = current_user
      if @post.save
        redirect_to :action => :index
      else
        render 'new'
      end
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @post = Post.find params[:id]
    else
      redirect_to login_path
    end
  end

  def edit
    if logged_in?
      @post = Post.find params[:id]
    else
      redirect_to login_path
    end
  end

  def update
    if logged_in?
      @post = Post.find params[:id]
      @post.update post_params
      if @post.save
        redirect_to post_path @post
      else
        render 'edit'
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      @post = Post.find params[:id]
      @post.destroy
      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

  def add_like
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
