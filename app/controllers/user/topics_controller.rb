class User::TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @user = current_user
  end

  def create
    user = User.find(params[:format])
    topic = user.topics.create!(topic_params)
    if topic.save
      flash[:notice] = "Topic created"
      redirect_to topic_path(topic)
    else
      flash[:error] = "Topic couldn't be save, fill all the forms"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :goal)
  end
end
