class TopicFacade
  attr_reader :topic

  def initialize(topic)
    @topic = topic
  end

  def current_question
    last_searched_question
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

  def last_searched_question
    topic.last_created_question
  end

  def topic_has_questions
    topic.has_questions
  end

private

  def service
   service = BingService.new(topic)
  end

end
