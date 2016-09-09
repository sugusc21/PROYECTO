class MessagesController < ApplicationController
  
  def index
  @mainproject = Mainproject.find(params[:mainproject_id])
  @messages = @mainproject.messages
  end

  def new
  @mainproject = Mainproject.find(params[:mainproject_id])
  @message = @mainproject.messages.build
  end

  def edit
  end

  def show
  	@message = Message.find(params[:id])
  end
end
