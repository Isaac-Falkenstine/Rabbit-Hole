class User::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    question = topic.questions.create(question_params)

    redirect_to user_topic_path(topic)
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
