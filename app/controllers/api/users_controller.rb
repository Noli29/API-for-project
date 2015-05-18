module Api
  class UsersController < ApplicationController
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
      @user =  User.create(params[:post])
      if @user.save
        render json: @post, status: 201, location: @user
      end
    end
  end
end
