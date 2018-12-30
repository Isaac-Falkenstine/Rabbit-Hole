class BingLink < SimpleDelegator
  attr_reader  :title,
               :saved_url,
               :question

  def initialize(link_data, question)
    @title = link_data[:name]
    @saved_url = link_data[:url]
    @question = question
  end

end
