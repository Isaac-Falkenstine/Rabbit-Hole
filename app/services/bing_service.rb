class BingService

  def initialize(topic)
    @_search = nil
    @topic = topic
  end

  def results(question)
    topic_text = topic.title
    question_text = question.title
    if question_text
      query = topic_text.gsub(" ", "+") + " " + question_text.gsub(" ", "+") 
    else
      query = topic_text.gsub(" ", "+")
    end
    get_json("/bing/v5.0/search?q=#{query}")
  end

  private

  attr_reader :topic

   def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => "https://api.cognitive.microsoft.com") do |f|
      f.headers['Ocp-Apim-Subscription-Key'] = ENV['BING_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
