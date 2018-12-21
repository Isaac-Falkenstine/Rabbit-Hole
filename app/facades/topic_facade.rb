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
    @bing.results(question)
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