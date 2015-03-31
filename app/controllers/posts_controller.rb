class PostsController < ApplicationController
    load_and_authorize_resource

    respond_to :html, :js

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(params[:post])

      if @post.save
        @user = User.find(session[:user_id])
        if @user.present?
          @user.posts << @post
          @user.save
        end
      else
        render "new"
      end
    end


    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      respond_to do |format|
        format.html { redirect_to :back}
      end
    end

    private

    def post_params
      params.require(:post).permit(:post)
    end

end