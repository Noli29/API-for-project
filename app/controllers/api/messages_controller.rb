module Api
  class MessagesController < ApplicationController

    skip_before_filter :verify_authenticity_token
    before_filter :authenticate

    def index
      @messages = Message.all
      respond_to do |format|
        format.json
      end
    end

    def show
      @message = Message.where(id: params[:id]).first
      respond_to do |format|
        format.json {
          render json: { error_message: "Not found", status: 404 } and return unless @message
        }
      end
    end

    def create
      @message =  Message.create(params[:message])
      if @message.save
        render json: @message , status: 201
      else
        render json: @message.errors, status: 422
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
