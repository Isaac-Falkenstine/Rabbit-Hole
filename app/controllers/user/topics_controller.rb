class User::TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @user = current_user
  end

  def create
    user = User.find(params[:format])
    topic = user.topics.create!(topic_params)
    if topic.save
      topics.questions.create!(question_params) if !question_params.empty?
      redirect_to topic_path
    else
      flash[:error] = "Topic couldn't be save"
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :goal)
  end

  def question_params
    params.require(:question).permit(:questions)
  end
end
