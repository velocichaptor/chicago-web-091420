class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    post = Post.create(post_params)

    redirect_to post_path(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
    
    # find_or_create_by solution
    # params.require(:post).permit(:title, :content, :user)
  end
end