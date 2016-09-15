class MessagesController < ApplicationController
before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
  @mainproject = Mainproject.find(params[:mainproject_id])
  @messages = @mainproject.messages
  
  end

  def new
  @mainproject = Mainproject.find(params[:mainproject_id])
  @message = @mainproject.messages.build
  end

  def create
  @mainproject = Mainproject.find(params[:mainproject_id])
  @message = Message.new(message_params)
  @message.mainproject = @mainproject
  respond_to do |format|
      if @message.save
        format.html { redirect_to [@mainproject, @message], notice: 'El mensaje se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to mainproject_messages_path(@mainproject), notice: 'El mensaje se ha borrado.' }
      format.json { head :no_content }
    end
  end

  def show
  	@message = Message.find(params[:id])

    if params[:mensaje].present?

      MessageMailer.mailmessages(params[:id],@message.description).deliver
    end
  end

  def process_messages
    @mainproject = Mainproject.find(params[:id])
    @message = Message.find(params[:id])
  end

private
    # Use callbacks to share common setup or constraints between actions.
  def set_message
      @message = Message.find(params[:id])
      @mainproject = Mainproject.find(params[:mainproject_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:description, :title, :messtype, :receivers, :mainproject_id)
    end
end
