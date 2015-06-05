module Api
  class PostsController < ApplicationController

    skip_before_filter :verify_authenticity_token
    before_filter :authenticate

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

    def destroy
      @post = Post.where(id: params[:id]).first
      @post.destroy
      render nothing: true, status: 204
    end

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.where(auth_token: token).first
      end
    end

    def render_unauthorized
      render json: "Bad credentials", status: 401
    end
  end
end