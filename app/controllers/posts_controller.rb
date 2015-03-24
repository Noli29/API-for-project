class PostsController < ApplicationController
    load_and_authorize_resource

    respond_to :html, :js

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(params[:post])
      if @post.save
        session[:post_id] = @post.id
        flash[:success] = ""
        redirect_to @post
      else
        render 'new'
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      respond_to do |format|
        format.html { redirect_to :back}
      end
    end

end