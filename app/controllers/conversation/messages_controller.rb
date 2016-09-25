module Conversation
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    def create
      @topic   = Topic.find(params[:topic_id])
      @message = @topic.conversation_messages.build(message_params)
      if @message.update user: current_user
        flash[:notice] = 'Your message submitted'
      else
        flash[:notice] = 'Can not submit empty message'
      end
      redirect_to :back
    end

    private

    def message_params
      params.require(:conversation_message).permit(:body)
    end
  end
end