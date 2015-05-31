module Api
  class PostsController < ApplicationController

    skip_before_filter :verify_authenticity_token

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
        render json: @post , status: 201
      else
        render json: @post.errors, status: 422
      end
    end

    def update
      @post = Post.where(id: params[:id]).first
      if @post.update(post_params)
        render json: @post, status: 200
      else
        render json: @post.errors, status: 422
      end
    end
  end
end