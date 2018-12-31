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
    if params[:topic_notes] != nil
      topic.update(topic_notes: params[:topic_notes])
      redirect_to user_topic_path(topic)
    else
    topic.update(update_params)
    redirect_to dashboard_path
    end
  end

  def create
    topic = current_user.topics.create(topic_params)
    if topic.save
      flash[:notice] = "Topic created"
      redirect_to user_topic_path(topic)
    else
      redirect_to new_user_topic_path
      flash[:error] = "Topic couldn't be saved, fill all the forms"
    end
  end

  private

  attr_reader :user

  def topic_params
    params.require(:topic).permit(:title, :goal)
  end

  def update_params
    params.fetch(:topic, {}).permit(:status, :complete, :topic_notes)
  end
end
