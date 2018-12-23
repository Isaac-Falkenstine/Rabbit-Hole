class TopicFacade
  attr_reader :topic

  def initialize(topic)
    @topic = topic
  end

  # def questions
  #   @topic.questions.map do |question|
  #     QuestionResult.new(question)
  #   end
  # end

  def search(question)
    raw_results = service.results(question)
    link_data = raw_results[:webPages][:value].map do |result|
      [result[:url], result[:name]]
    end.first(5)
  end

  def search_links(link_data, question)
    link_data.map do |link|
      question.links.create(url: link.first, name: link.last)
    end
  end

  def new_question
    topic.questions.new
  end

  private

  def service
   BingServiceAdapter.new(topic)
  end
end

# class QuestionResult < SimpleDelegator
#   def results
#     search_client.results(self).map do |raw_result|
#       Result.new(raw_result)
#     end
#   end
# end
