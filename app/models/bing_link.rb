class BingLink < SimpleDelegator
  attr_reader  :name,
               :url,
               :question

  def initialize(link_data, question)
    @name = link_data[:name]
    @url = link_data[:url]
    @question = question
  end

end
