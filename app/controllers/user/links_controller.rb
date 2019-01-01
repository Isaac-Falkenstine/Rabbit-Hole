class User::LinksController < ApplicationController
protect_from_forgery except: :new
  def new
    @link = Link.new
    @question = Question.find(params[:question_id])
    @topic = Topic.find(params[:topic_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    question = Question.find(params[:question_id])
    topic = Topic.find(params[:topic_id])
    link = question.links.create(link_params)
    
    redirect_to user_topic_path(topic)
  end

  def update

  end

  private

  def link_params
    params.require(:link).permit(:name, :website_link_text)
  end


end
