class TopicFacade
  attr_reader :topic

  def initialize(topic)
    @topic = topic
  end

  def search(question)
    raw_results = service.results(question)
    link_data = raw_results[:webPages][:value].map do |result|
      question.links.new(url: result[:url], name: result[:name])
    end.first(5)
  end

  def topic_questions
    topic.questions
  end

  def search_links(link_data, question)
    link_data.map do |link|
      question.links.create(url: link.first, name: link.last)
    end
  end

  def new_question
    topic.questions.new
  end

  def searched_question
    topic.questions.last
  end

  private

  def service
   BingService.new(topic)
  end
end

# class QuestionResult < SimpleDelegator
#   def results
#     search_client.results(self).map do |raw_result|
#       Result.new(raw_result)
#     end
#   end
# end
