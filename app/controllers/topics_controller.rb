class TopicsController < ApplicationController

  def index
    @topic = Topic.all
  end

  def show
    topic = Topic.find(params[:format]||params[:id])
    @facade = TopicFacade.new(topic) 
  end
end
