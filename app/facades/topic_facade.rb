class TopicFacade
  attr_reader :topic

  def initialize(topic)
    @topic = topic
  end

  def bing_search(question)
    raw_results = service.search_results(question)
    link_data = raw_results[:webPages][:value].map do |result|
      question.links.new(url: result[:url], name: result[:name])
    end.first(5)
  end

  def topic_questions
    topic.questions
  end

  def new_question
    topic.questions.new
  end

  def last_searched_question
    topic.questions.last
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
