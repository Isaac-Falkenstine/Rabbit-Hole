class User::TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @user = current_user
  end

  def index
  end

  def show
    if params[:q_id]
      topic = Topic.find(params[:id])
      question = Question.find(params[:q_id])
      @facade = TopicFacade.new(topic, question, user)
    else
      topic = Topic.find(params[:id])
      @facade = TopicFacade.new(topic, user)
    end
  end

  def update
    topic = Topic.find(params[:id])
    if update_params[:status]
      topic.update(status: update_params[:status].to_i, topic_notes: params[:topic_notes])
    elsif update_params[:complete]
      topic.update(complete: true, topic_notes: params[:topic_notes])
    else
      topic.update(topic_notes: params[:topic_notes])
    end

    if params[:topic_notes]
      redirect_to user_topic_path(topic)
    else
      redirect_to dashboard_path
    end
  end

  def create
    topic = current_user.topics.create(topic_params)
    if topic.save
      flash[:notice] = "Topic created"
      redirect_to user_topic_path(topic)
    else
      flash[:error] = "Topic couldn't be save, fill all the forms"
    end
  end

  private

  attr_reader :user

  def topic_params
    params.require(:topic).permit(:title, :goal)
  end

  def update_params
    params.fetch(:topic, {}).permit(:status, :complete)
  end
end
