module Api
  class PostsController < ApplicationController

    def index
      @posts = Post.all
      respond_to do |format|
        format.json
      end
    end

    def show
      @post = Post.where(id: params[:id]).first
      respond_to do |format|
        format.json {
          render json: { error_message: "Not found", status: 404 } and return unless @post
        }
      end
    end

    def create
      @post =  Post.create(params[:post])
      if @post.save
        render json: @post, status: 201, location: @post
      end
    end
  end
end