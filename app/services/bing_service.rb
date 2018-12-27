class BingService
  attr_reader :topic

  def initialize(topic)
    @topic = topic
  end

  def search_results(question)
    query = topic.title.gsub(" ", "+") + "+" + question.title.gsub(" ", "+")
    json = get_json("/bing/v7.0/search?q=#{query}")
  end

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
