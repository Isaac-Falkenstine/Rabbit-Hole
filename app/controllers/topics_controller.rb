class TopicsController < ApplicationController

  def index
    @topic = Topic.all
  end

  def show

  end
end
