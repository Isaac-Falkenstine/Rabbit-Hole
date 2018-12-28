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
      @facade = TopicFacade.new(topic, question)
    else
      topic = Topic.find(params[:id])
      @facade = TopicFacade.new(topic)
    end
  end

  def update
    topic = Topic.find(params[:id])
    if topic.enable?
      topic.update(status: 0)
    elsif
      topic.update(complete: true)
    else
      topic.update(status: 1)
    end
    redirect_to dashboard_path
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

  def topic_params
    params.require(:topic).permit(:title, :goal)
  end

end
