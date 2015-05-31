module Api
  class MessagesController < ApplicationController

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
      @message =  Message.create(params[:post])
      if @message.save
        render json: @post , status: 201
      else
        render json: @post.errors, status: 422
      end
    end

  end
end
