class BingServiceAdapter

  def initialize(topic)
    @_search = nil
    @topic = topic
  end

  def results(question)
    query = question.title.gsub(" ", "+") #plus topic name
    get_json("/bing/v5.0/search?q=#{query}")
  end

  private

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
