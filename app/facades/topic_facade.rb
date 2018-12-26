class TopicFacade
  attr_reader :topic

  def initialize(topic)
    @topic = topic
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

  private

  def service
   @service ||= BingService.new(topic)
  end

end

# class QuestionResult < SimpleDelegator
#   def results
#     search_client.results(self).map do |raw_result|
#       Result.new(raw_result)
#     end
#   end
# end
