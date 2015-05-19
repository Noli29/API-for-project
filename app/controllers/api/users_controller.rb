module Api
  class UsersController < ApplicationController

    skip_before_filter :verify_authenticity_token

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
  end
end
