class PostsController < ApplicationController
  load_and_authorize_resource

  respond_to :html, :js

  def new
    @post = Post.new
  end

  def index
    @posts = Post.where(user_id:session[:user_id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to user_path(session[:user_id])
    else
      render "new"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  private

  def post_params
    params.require(:post).permit(:post)
  end

end