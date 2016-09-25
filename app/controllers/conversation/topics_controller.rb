module Conversation
  class TopicsController < ApplicationController
    def show
      @topic = Topic.find(params[:id])
    end
  end
end