class TopicFacade
  attr_reader :topic,
              :bing
  def initialize(topic)
    @topic = topic
    @bing  = BingServiceAdapter.new(topic)
  end

  def questions
    @topic.questions.map do |question|
      QuestionResult.new(question)
    end
  end

  def search(question)
    raw_results = @bing.results(question)
    link_data = raw_results[:webPages][:value].map do |result|
      [result[:url], result[:name]]
    end.first(5)
  end

  def search_links(link_data, question)
    link_data.map do |link|
      question.links.create(url: link.first, name: link.last)
    end
  end
end

class QuestionResult < SimpleDelegator
  def results
    search_client.results(self).map do |raw_result|
      Result.new(raw_result)
    end
  end

   def search_client
    BingServiceAdapter.new(topic)
   end

end
