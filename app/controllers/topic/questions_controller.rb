class Topic::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    topic = Topic.find(params[:id])
    @question = topic.questions.create(question_params)

    redirect_to user_topic_path(topic)
  end

  private

  def question_params
    params.require(:topic).permit(:title)
  end

end
