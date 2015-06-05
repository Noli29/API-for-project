module Api
  class UsersController < ApplicationController

    skip_before_filter :verify_authenticity_token
    before_filter :authenticate

    def index
      @users = User.all
      respond_to do |format|
        format.json
      end
    end

    def show
      @user = User.where(id: params[:id]).first
      respond_to do |format|
        format.json {
          render json: { error_message: "Not found", status: 404 } and return unless @user
        }
      end
    end

    def create
      @user =  User.create(params[:user])
      if @user.save
        render json: @user , status: 201
      else
        render json: @user.errors, status: 422
      end
    end

    def update
      @user = User.where(id: params[:id]).first
      if @user.update_attributes(params[:user])
        render json: @user, status: 200
      else
        render json: @user.errors, status: 422
      end
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
