class BingLink < SimpleDelegator
  attr_reader  :title,
               :url,
               :question

  def initialize(link_data, question)
    @title = link_data[:name]
    @url = link_data[:url]
    @question = question
  end

end
