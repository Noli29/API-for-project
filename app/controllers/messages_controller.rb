class MessagesController < ApplicationController
  # before_filter :check_login

  def index
    @messages = params[:sent] == "1" ? current_user.sent_messages : current_user.received_messages
  end

  def show
    @message = Message.read_message(params[:id], current_user)
    redirect_to root_url unless @message.present?
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.create params[:message]
    redirect_to messages_path(:sent => 1)
  end

  # private
  # def check_login
  #   redirect_to root_url and return unless logged_in?
  # end

end
