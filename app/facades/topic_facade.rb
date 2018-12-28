class TopicFacade
  attr_reader :topic,
              :main_question

  def initialize(topic, main_question=nil)
    @topic = topic
    @main_question = main_question
  end

  def current_question
    if main_question == nil
      topic.last_created_question
    else
      main_question
    end
  end

  def bing_search(question, limit=5)
    raw_results = service.search_results(question)
    link_data = raw_results[:webPages][:value].map do |result|
      BingLink.new(result, question: question)
    end.first(limit)
  end

  def topic_questions
    topic.questions
  end

  def new_question
    Question.new(topic_id: topic.id)
  end

  def topic_has_questions
    topic.has_questions
  end

private

  def service
   service = BingService.new(topic)
  end

end
